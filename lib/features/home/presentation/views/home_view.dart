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
import 'package:wasselni/l10n/app_localizations.dart';

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

  String getStatusText(BuildContext context, String status) {
    final l10n = AppLocalizations.of(context);

    switch (status) {
      case 'تم التسليم':
        return l10n.delivered;

      case 'في الطريق':
        return l10n.onTheWay;

      case 'ملغي':
        return l10n.cancelled;

      case 'تم استلام الطلب':
        return l10n.orderReceived;

      default:
        return status;
    }
  }

  String formatPrice(BuildContext context, dynamic price) {
    final l10n = AppLocalizations.of(context);

    if (price == null) {
      return '0 ${l10n.currency}';
    }

    if (price is num) {
      return '${price.toStringAsFixed(0)} ${l10n.currency}';
    }

    return '$price ${l10n.currency}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
                  return  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 20, 16, 24),
                      child: Center(
                        child: Text(
                       l10n.noOrdersYet,
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

                          price: formatPrice(context, order['totalPrice'] ?? order['price'] ?? 0),

                          status: getStatusText(context, status),

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
