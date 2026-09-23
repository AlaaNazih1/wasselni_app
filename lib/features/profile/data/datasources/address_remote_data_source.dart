import 'package:cloud_firestore/cloud_firestore.dart';

class AddressRemoteDataSource {
  AddressRemoteDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _addresses(String uid) {
    return _firestore.collection('users').doc(uid).collection('addresses');
  }

  Future<List<Map<String, dynamic>>> getAddresses(String uid) async {
    final snapshot = await _addresses(
      uid,
    ).orderBy('createdAt', descending: true).get();

    return snapshot.docs.map((doc) {
      return {'id': doc.id, ...doc.data()};
    }).toList();
  }

  Future<void> addAddress({
    required String uid,
    required String title,
    required String address,
    required String type,
  }) async {
    await _addresses(uid).add({
      'title': title,
      'address': address,
      'type': type,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateAddress({
    required String uid,
    required String addressId,
    required String title,
    required String address,
    required String type,
  }) async {
    await _addresses(
      uid,
    ).doc(addressId).update({'title': title, 'address': address, 'type': type});
  }

  Future<void> deleteAddress({
    required String uid,
    required String addressId,
  }) async {
    await _addresses(uid).doc(addressId).delete();
  }
}
