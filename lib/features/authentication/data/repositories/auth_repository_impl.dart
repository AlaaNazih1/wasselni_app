import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final AuthRemoteDataSource _remoteDataSource;

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
  Future<void> logout() async {
    await _remoteDataSource.logout();
  }

  @override
  User? get currentUser {
    return _remoteDataSource.currentUser;
  }

  @override
  Stream<User?> get authStateChanges {
    return _remoteDataSource.authStateChanges;
  }
}
