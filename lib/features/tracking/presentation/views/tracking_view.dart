import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasselni/features/tracking/presentation/controllers/order_controller.dart';

import 'package:wasselni/features/tracking/widgets/delivery_driver_card.dart';
import 'package:wasselni/features/tracking/widgets/order_timeline.dart';
import 'package:wasselni/features/tracking/widgets/tracking_filter.dart';
import 'package:wasselni/features/tracking/widgets/tracking_header.dart';
import 'package:wasselni/features/tracking/widgets/tracking_order_card.dart';

import '../../../../core/theme/app_colors.dart';

class TrackingView extends ConsumerStatefulWidget {
  const TrackingView({super.key});

  @override
  ConsumerState<TrackingView> createState() => _TrackingViewState();
}

class _TrackingViewState extends ConsumerState<TrackingView> {
  int selectedFilter = 0;

 String _getStatusText(String status) {
    switch (status) {
      case 'pending':
      case 'تم استلام الطلب':
        return 'تم استلام الطلب';

      case 'inProgress':
      case 'في الطريق':
        return 'في الطريق';

      case 'delivered':
      case 'تم التسليم':
        return 'تم التسليم';

      case 'cancelled':
      case 'ملغي':
        return 'ملغي';

      default:
        return 'غير معروف';
    }
  }

 Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
      case 'تم استلام الطلب':
        return Colors.orange;

      case 'inProgress':
      case 'في الطريق':
        return Colors.blue;

      case 'delivered':
      case 'تم التسليم':
        return AppColors.success;

      case 'cancelled':
      case 'ملغي':
        return AppColors.grey;

      default:
        return AppColors.grey;
    }
  }

  List<Map<String, dynamic>> _filterOrders(List<Map<String, dynamic>> orders) {
    if (selectedFilter == 0) {
      return orders;
    }

   if (selectedFilter == 1) {
      return orders
          .where(
            (order) =>
                order['status'] == 'inProgress' ||
                order['status'] == 'في الطريق',
          )
          .toList();
    }

    return orders
        .where(
          (order) =>
              order['status'] == 'delivered' || order['status'] == 'تم التسليم',
        )
        .toList();

  }

  void changeFilter(int index) {
    setState(() {
      selectedFilter = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ordersAsync = ref.watch(ordersProvider);

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: ordersAsync.when(
          loading: () {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          },

          error: (error, stackTrace) {
            debugPrint('ORDERS ERROR: $error');
            debugPrintStack(stackTrace: stackTrace);

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'حدث خطأ في تحميل الطلبات\n\n$error',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.error,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          },

          data: (orders) {
            final filteredOrders = _filterOrders(orders);

            return CustomScrollView(
              slivers: [
                const TrackingHeader(),

                TrackingFilter(
                  selectedFilter: selectedFilter,
                  onFilterChanged: changeFilter,
                ),

                if (filteredOrders.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'لا توجد طلبات',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                if (filteredOrders.isNotEmpty)
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                       final order = filteredOrders[index];

                        final status = order['status'] ?? 'pending';

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TrackingOrderCard(
                            orderId: order['id'] ?? '',
                            orderNumber: order['orderNumber'] ?? '',
                            status: _getStatusText(status),
                            statusColor: _getStatusColor(status),
                            from: order['from'] ?? '',
                            to: order['to'] ?? '',
                            price: '${order['totalPrice'] ?? 0} جنيه',
                            time: '',
                          ),
                        );
                      }, childCount: filteredOrders.length),
                    ),
                  ),

                if (filteredOrders.isNotEmpty)
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        const SizedBox(height: 4),

                     DeliveryDriverCard(
                          driverName:
                              (filteredOrders.first['driverName'] ?? '')
                                  .toString()
                                  .trim()
                                  .isEmpty
                              ? "احمد محمد"
                              : filteredOrders.first['driverName'].toString(),
                          driverImage:
                              'assets/images/wasselni_logo-removebg-preview.png',
                        ),

                        const SizedBox(height: 14),

                        OrderTimeline(
                          status: filteredOrders.first['status'] ?? 'pending',
                          createdAt: filteredOrders.first['createdAt'],
                          inProgressAt: filteredOrders.first['inProgressAt'],
                          deliveredAt: filteredOrders.first['deliveredAt'],
                        ),
                      ]),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
