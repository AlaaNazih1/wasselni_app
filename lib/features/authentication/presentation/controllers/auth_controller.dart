
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
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
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      await _repository.register(email: email, password: password);

      state = const AsyncData(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      state = AsyncError(_getAuthErrorMessage(e), stackTrace);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    try {
      await _repository.login(email: email, password: password);

      state = const AsyncData(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      state = AsyncError(_getAuthErrorMessage(e), stackTrace);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
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
