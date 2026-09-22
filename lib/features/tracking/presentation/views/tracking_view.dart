import 'package:flutter/material.dart';
import 'package:wasselni/features/tracking/widgets/delivery_driver_card.dart';
import 'package:wasselni/features/tracking/widgets/order_timeline.dart';
import 'package:wasselni/features/tracking/widgets/tracking_filter.dart';
import 'package:wasselni/features/tracking/widgets/tracking_header.dart';
import 'package:wasselni/features/tracking/widgets/tracking_order_card.dart';

import '../../../../core/theme/app_colors.dart';

class TrackingView extends StatefulWidget {
  const TrackingView({super.key});

  @override
  State<TrackingView> createState() => _TrackingViewState();
}

class _TrackingViewState extends State<TrackingView> {
  int selectedFilter = 0;

  final List<Map<String, dynamic>> orders = [
    {
      'orderNumber': '#1256',
      'status': 'تم التسليم',
      'statusColor': AppColors.success,
      'from': 'ديروط',
      'to': 'أسيوط',
      'price': '80 جنيه',
      'time': '10:10 ص',
      'driverName': 'محمد أحمد',
    },
    {
      'orderNumber': '#1255',
      'status': 'في الطريق',
      'statusColor': Colors.blue,
      'from': 'ديروط',
      'to': 'أسيوط',
      'price': '80 جنيه',
      'time': '10:35 ص',
      'driverName': 'محمد أحمد',
    },
    {
      'orderNumber': '#1254',
      'status': 'ملغي',
      'statusColor': AppColors.grey,
      'from': 'ديروط',
      'to': 'أسيوط',
      'price': '80 جنيه',
      'time': '10:10 ص',
      'driverName': 'محمد أحمد',
    },
  ];

  List<Map<String, dynamic>> get filteredOrders {
    if (selectedFilter == 0) {
      return orders;
    }

    if (selectedFilter == 1) {
      return orders.where((order) => order['status'] == 'في الطريق').toList();
    }

    return orders.where((order) => order['status'] == 'تم التسليم').toList();
  }

  void changeFilter(int index) {
    setState(() {
      selectedFilter = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const TrackingHeader(),

            TrackingFilter(
              selectedFilter: selectedFilter,
              onFilterChanged: changeFilter,
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final order = filteredOrders[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TrackingOrderCard(
                      orderNumber: order['orderNumber'],
                      status: order['status'],
                      statusColor: order['statusColor'],
                      from: order['from'],
                      to: order['to'],
                      price: order['price'],
                      time: order['time'],
                    ),
                  );
                }, childCount: filteredOrders.length),
              ),
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
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 4),

                    DeliveryDriverCard(
                      driverName: filteredOrders[0]['driverName'],
                      driverImage: 'assets/images/wasselni_logo-removebg-preview.png',
                    ),

                    const SizedBox(height: 14),

                    const OrderTimeline(),
                  ]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
