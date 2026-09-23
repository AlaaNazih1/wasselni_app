import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationRemoteDataSource {
  NotificationRemoteDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _notifications(String uid) {
    return _firestore.collection('users').doc(uid).collection('notifications');
  }

  Future<List<Map<String, dynamic>>> getNotifications(String uid) async {
    final snapshot = await _notifications(
      uid,
    ).orderBy('createdAt', descending: true).get();

    return snapshot.docs.map((doc) {
      return {'id': doc.id, ...doc.data()};
    }).toList();
  }

  Future<void> markAsRead({
    required String uid,
    required String notificationId,
  }) async {
    await _notifications(uid).doc(notificationId).update({'isRead': true});
  }
}
