import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../datasources/user_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required UserRemoteDataSource userRemoteDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _userRemoteDataSource = userRemoteDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  final UserRemoteDataSource _userRemoteDataSource;

  @override
  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    return await _remoteDataSource.register(email: email, password: password);
  }

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await _remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<void> createUser({
    required String uid,
    required String name,
    required String phone,
    required String email,
  }) async {
    await _userRemoteDataSource.createUser(
      uid: uid,
      name: name,
      phone: phone,
      email: email,
    );
  }

  @override
  Future<String?> getEmailByPhone(String phone) async {
    return await _userRemoteDataSource.getEmailByPhone(phone);
  }

  @override
  Future<void> logout() async {
    await _remoteDataSource.logout();
  }

  @override
  User? get currentUser => _remoteDataSource.currentUser;

  @override
  Stream<User?> get authStateChanges => _remoteDataSource.authStateChanges;
}
