import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/notification_remote_data_source.dart';

final notificationRemoteDataSourceProvider =
    Provider<NotificationRemoteDataSource>((ref) {
      return NotificationRemoteDataSource();
    });

final notificationsProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    return [];
  }

  final dataSource = ref.read(notificationRemoteDataSourceProvider);

  return dataSource.getNotifications(user.uid);
});

final notificationControllerProvider = Provider<NotificationController>((ref) {
  return NotificationController(
    dataSource: ref.read(notificationRemoteDataSourceProvider),
  );
});

class NotificationController {
  NotificationController({required NotificationRemoteDataSource dataSource})
    : _dataSource = dataSource;

  final NotificationRemoteDataSource _dataSource;

  Future<void> markAsRead(String notificationId) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('المستخدم غير مسجل الدخول');
    }

    await _dataSource.markAsRead(uid: user.uid, notificationId: notificationId);
  }
}
