import 'package:flutter/material.dart';
import 'package:wasselni/features/profile/widgets/notification_card.dart';
import 'package:wasselni/features/profile/widgets/notifications_header.dart';
import '../../../../core/theme/app_colors.dart';


class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  NotificationCard(
                    icon: Icons.local_shipping_outlined,
                    title: 'طلبك في الطريق',
                    message: 'المندوب أحمد محمد في طريقه لتوصيل طلبك.',
                    time: 'منذ 5 دقائق',
                    iconColor: Colors.blue,
                  ),

                  NotificationCard(
                    icon: Icons.check_circle_outline,
                    title: 'تم تسليم الطلب',
                    message: 'تم تسليم طلبك رقم #1256 بنجاح.',
                    time: 'منذ ساعة',
                    iconColor: AppColors.success,
                  ),

                  NotificationCard(
                    icon: Icons.shopping_bag_outlined,
                    title: 'تم استلام طلبك',
                    message: 'تم استلام طلبك رقم #1257 وجاري تحضيره.',
                    time: 'منذ ساعتين',
                    iconColor: AppColors.primary,
                  ),

                  NotificationCard(
                    icon: Icons.local_offer_outlined,
                    title: 'عرض جديد',
                    message: 'خصم خاص على رسوم التوصيل لفترة محدودة.',
                    time: 'أمس',
                    iconColor: Colors.orange,
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
