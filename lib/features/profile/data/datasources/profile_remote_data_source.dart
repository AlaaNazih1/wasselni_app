import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRemoteDataSource {
  ProfileRemoteDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();

    if (!doc.exists) {
      return null;
    }

    return doc.data();
  }

 Future<void> updateProfileImage({
    required String uid,
    required File image,
  }) async {
    final bytes = await image.readAsBytes();

    // تحويل الصورة إلى Base64
    final base64Image = base64Encode(bytes);

    // حفظ الصورة داخل Firestore
    await _firestore.collection('users').doc(uid).update({
      'profileImageBase64': base64Image,
    });
  }

  Future<void> updateUserData({
    required String uid,
    required String name,
    required String phone,
    required String email,
  }) async {
    await _firestore.collection('users').doc(uid).update({
      'name': name,
      'phone': phone,
      'email': email,
    });
  }
}
