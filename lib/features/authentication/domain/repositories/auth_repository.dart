import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> register({
    required String email,
    required String password,
  });

  Future<UserCredential> login({
    required String email,
    required String password,
  });

  Future<void> createUser({
    required String uid,
    required String name,
    required String phone,
    required String email,
  });

  Future<String?> getEmailByPhone(String phone);

  Future<void> logout();

  User? get currentUser;

  Stream<User?> get authStateChanges;
}
