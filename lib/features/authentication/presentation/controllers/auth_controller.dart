
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:wasselni/features/authentication/data/datasources/user_remote_data_source.dart';

import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource();
});

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
    userRemoteDataSource: ref.read(userRemoteDataSourceProvider),
  );
});

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
      return AuthController(repository: ref.read(authRepositoryProvider));
    });

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController({required AuthRepository repository})
    : _repository = repository,
      super(const AsyncData(null));

  final AuthRepository _repository;

  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      final userCredential = await _repository.register(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user == null) {
        throw Exception('Failed to create user');
      }

      await _repository.createUser(
        uid: user.uid,
        name: name,
        phone: phone,
        email: email,
      );

      state = const AsyncData(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      state = AsyncError(_getAuthErrorMessage(e), stackTrace);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  Future<void> login({required String phone, required String password}) async {
    state = const AsyncLoading();

    try {
      // 1. Get email using phone number
      final email = await _repository.getEmailByPhone(phone);

      if (email == null) {
        throw Exception('رقم الهاتف غير مسجل');
      }

      // 2. Login using Firebase Auth
      await _repository.login(email: email, password: password);

      state = const AsyncData(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      state = AsyncError(_getAuthErrorMessage(e), stackTrace);
    } catch (e, stackTrace) {
      state = AsyncError(
        e.toString().replaceFirst('Exception: ', ''),
        stackTrace,
      );
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();

    try {
      await _repository.logout();

      state = const AsyncData(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      state = AsyncError(_getAuthErrorMessage(e), stackTrace);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  String _getAuthErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'المستخدم غير موجود';

      case 'wrong-password':
      case 'invalid-credential':
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة';

      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل';

      case 'weak-password':
        return 'كلمة المرور ضعيفة';

      case 'invalid-email':
        return 'البريد الإلكتروني غير صحيح';

      case 'network-request-failed':
        return 'تأكد من اتصالك بالإنترنت';

      default:
        return 'حدث خطأ، حاول مرة أخرى';
    }
  }
}
