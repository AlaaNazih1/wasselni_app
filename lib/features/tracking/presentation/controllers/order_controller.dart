import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return Stream.value([]);
  }
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('orders')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snapshot) {
        return snapshot.docs.map((doc) {
          return {'id': doc.id, ...doc.data()};
        }).toList();
      });
});
Future<void> updateOrderStatus({
  required String orderId,
  required String status,
}) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw Exception('يجب تسجيل الدخول أولاً');
  }
  final orderRef = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('orders')
      .doc(orderId);
  final updateData = <String, dynamic>{
    'status': status,
    'updatedAt': FieldValue.serverTimestamp(),
  };
  switch (status) {
    case 'inProgress':
      updateData['inProgressAt'] = FieldValue.serverTimestamp();
      break;
    case 'delivered':
      updateData['deliveredAt'] = FieldValue.serverTimestamp();
      break;
    case 'cancelled':
      updateData['cancelledAt'] = FieldValue.serverTimestamp();
      break;
  }
  await orderRef.update(updateData);
}
