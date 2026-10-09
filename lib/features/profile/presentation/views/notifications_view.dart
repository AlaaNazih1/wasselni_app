import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/core/utils/notification_time_formatter.dart';
import 'package:wasselni/features/profile/widgets/notification_card.dart';
import 'package:wasselni/features/profile/widgets/notifications_header.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import '../controllers/notification_controller.dart';

class NotificationsView extends ConsumerStatefulWidget {
  const NotificationsView({super.key});

  @override
  ConsumerState<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends ConsumerState<NotificationsView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await ref.read(notificationControllerProvider).markAllAsRead();

        if (!mounted) return;

        ref.invalidate(unreadNotificationsProvider);
      } catch (_) {
        // نتجنب حدوث خطأ غير معالج لو فشل تحديث حالة القراءة.
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
                    error: (error, stackTrace) => Padding(
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        l10n.notificationsLoadError,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.error),
                      ),
                    ),
                    data: (notifications) {
                      if (notifications.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Text(
                            l10n.noNotifications,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }

                      return Column(
                        children: notifications.map((notification) {
                          final type = (notification['type'] ?? 'default')
                              .toString();

                          return NotificationCard(
                            icon: _getNotificationIcon(type),
                            title: (notification['title'] ?? '').toString(),
                            message: (notification['message'] ?? '').toString(),
                            time: NotificationTimeFormatter.format(
                              context,
                              notification['createdAt'],
                            ),
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
