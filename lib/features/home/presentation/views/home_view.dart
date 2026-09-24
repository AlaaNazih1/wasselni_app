import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/features/home/presentation/views/home_drawer.dart';
import 'package:wasselni/features/home/widget/home_banner.dart';
import 'package:wasselni/features/home/widget/home_categories.dart';
import 'package:wasselni/features/home/widget/home_greeting.dart';
import 'package:wasselni/features/home/widget/home_header.dart';
import 'package:wasselni/features/home/widget/latest_orders_header.dart';
import 'package:wasselni/features/home/widget/order_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.onShowAllOrders});

  final VoidCallback onShowAllOrders;

  Stream<QuerySnapshot<Map<String, dynamic>>> get latestOrdersStream {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Stream.empty();
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('orders')
        .orderBy('createdAt', descending: true)
        .limit(2)
        .snapshots();
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'تم التسليم':
        return AppColors.orderDone;

      case 'في الطريق':
        return AppColors.orderInProgress;

      case 'ملغي':
        return AppColors.grey;

      case 'تم استلام الطلب':
        return AppColors.primary;

      default:
        return AppColors.primary;
    }
  }

  String getStatusText(String status) {
    switch (status) {
      case 'تم التسليم':
        return 'تم التسليم';

      case 'في الطريق':
        return 'في الطريق';

      case 'ملغي':
        return 'ملغي';

      case 'تم استلام الطلب':
        return 'تم استلام الطلب';

      default:
        return status;
    }
  }

  String formatPrice(dynamic price) {
    if (price == null) {
      return '0 جنيه';
    }

    if (price is num) {
      return '${price.toStringAsFixed(0)} جنيه';
    }

    return '$price جنيه';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      drawer: const HomeDrawer(),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const HomeHeader(),

            const HomeGreeting(),

            const HomeCategories(),

            const HomeBanner(),

            LatestOrdersHeader(onShowAllOrders: onShowAllOrders),

            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: latestOrdersStream,

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'حدث خطأ أثناء تحميل الطلبات',
                          style: TextStyle(
                            color: AppColors.error,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                final orders = snapshot.data?.docs ?? [];

                if (orders.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 20, 16, 24),
                      child: Center(
                        child: Text(
                          'لا توجد طلبات حتى الآن',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),

                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final doc = orders[index];

                      final order = doc.data();

                      final orderId = doc.id;

                      final status = order['status'] ?? 'تم استلام الطلب';

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),

                        child: OrderCard(
                          orderId: orderId,

                          orderNumber: order['orderNumber'] ?? '#${index + 1}',

                          from: order['from'] ?? '',

                          to: order['to'] ?? '',

                          price: formatPrice(order['totalPrice'] ?? order['price'] ?? 0),

                          status: getStatusText(status),

                          statusColor: getStatusColor(status),
                        ),
                      );
                    }, childCount: orders.length),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
