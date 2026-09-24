import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/profile_remote_data_source.dart';

final profileRemoteDataSourceProvider = Provider<ProfileRemoteDataSource>((
  ref,
) {
  return ProfileRemoteDataSource();
});

final profileProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    return null;
  }

  final dataSource = ref.read(profileRemoteDataSourceProvider);

  return dataSource.getUserData(user.uid);
});

final profileUpdateProvider = Provider<ProfileUpdateController>((ref) {
  return ProfileUpdateController(
    dataSource: ref.read(profileRemoteDataSourceProvider),
  );
});

class ProfileUpdateController {
  ProfileUpdateController({required ProfileRemoteDataSource dataSource})
    : _dataSource = dataSource;

  final ProfileRemoteDataSource _dataSource;

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String email,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('المستخدم غير مسجل الدخول');
    }

    await _dataSource.updateUserData(
      uid: user.uid,
      name: name,
      phone: phone,
      email: email,
    );

    await user.updateDisplayName(name);
  }

  Future<void> updateProfileImage(File image) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('المستخدم غير مسجل الدخول');
    }

    await _dataSource.updateProfileImage(uid: user.uid, image: image);
  }
}
