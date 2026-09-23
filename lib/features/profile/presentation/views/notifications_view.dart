import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wasselni/features/profile/widgets/notification_card.dart';
import 'package:wasselni/features/profile/widgets/notifications_header.dart';

import '../../../../core/theme/app_colors.dart';
import '../controllers/notification_controller.dart';

class NotificationsView extends ConsumerWidget {
  const NotificationsView({super.key});

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'delivery':
        return Icons.local_shipping_outlined;

      case 'delivered':
        return Icons.check_circle_outline;

      case 'order':
        return Icons.shopping_bag_outlined;

      case 'offer':
        return Icons.local_offer_outlined;

      default:
        return Icons.notifications_none;
    }
  }

  Color _getNotificationColor(String type) {
    switch (type) {
      case 'delivery':
        return Colors.blue;

      case 'delivered':
        return AppColors.success;

      case 'order':
        return AppColors.primary;

      case 'offer':
        return Colors.orange;

      default:
        return AppColors.grey;
    }
  }

  String _formatTime(dynamic value) {
    if (value == null) {
      return '';
    }

    if (value is Timestamp) {
      final date = value.toDate();
      final difference = DateTime.now().difference(date);

      if (difference.inMinutes < 1) {
        return 'منذ لحظات';
      }

      if (difference.inMinutes < 60) {
        return 'منذ ${difference.inMinutes} دقيقة';
      }

      if (difference.inHours < 24) {
        return 'منذ ${difference.inHours} ساعة';
      }

      if (difference.inDays == 1) {
        return 'أمس';
      }

      return 'منذ ${difference.inDays} يوم';
    }

    return value.toString();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const NotificationsHeader(),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  notificationsAsync.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),

                    error: (error, stackTrace) => const Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        'حدث خطأ في تحميل الإشعارات',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.error),
                      ),
                    ),

                    data: (notifications) {
                      if (notifications.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Text(
                            'لا توجد إشعارات',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }

                      return Column(
                        children: notifications.map((notification) {
                          final type = notification['type'] ?? 'default';

                          return NotificationCard(
                            icon: _getNotificationIcon(type),
                            title: notification['title'] ?? '',
                            message: notification['message'] ?? '',
                            time: _formatTime(notification['createdAt']),
                            iconColor: _getNotificationColor(type),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
