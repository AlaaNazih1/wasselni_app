import 'package:flutter/material.dart';
import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/features/home/widget/order_card.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});
  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  int selectedTab = 0;
  final List<Map<String, dynamic>> orders = [
    {
      'orderNumber': '#1258',
      'from': 'ديروط',
      'to': 'أسيوط',
      'price': '80 جنيه',
      'status': 'تم التسليم',
      'statusColor': AppColors.orderDone,
    },
    {
      'orderNumber': '#1257',
      'from': 'ديروط',
      'to': 'أسيوط',
      'price': '80 جنيه',
      'status': 'في الطريق',
      'statusColor': AppColors.orderInProgress,
    },
    {
      'orderNumber': '#1256',
      'from': 'أسيوط',
      'to': 'ديروط',
      'price': '100 جنيه',
      'status': 'تم التسليم',
      'statusColor': AppColors.orderDone,
    },
  ];
  List<Map<String, dynamic>> get filteredOrders {
    if (selectedTab == 0) {
      return orders;
    }
    if (selectedTab == 1) {
      return orders.where((order) => order['status'] == 'في الطريق').toList();
    }
    return orders.where((order) => order['status'] == 'تم التسليم').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'طلباتي',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          _buildTabs(),
          const SizedBox(height: 20),
          Expanded(
            child: filteredOrders.isEmpty
                ? const Center(
                    child: Text(
                      'لا توجد طلبات',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: filteredOrders.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 12);
                    },
                    itemBuilder: (context, index) {
                      final order = filteredOrders[index];
                      return OrderCard(
                        orderNumber: order['orderNumber'],
                        from: order['from'],
                        to: order['to'],
                        price: order['price'],
                        status: order['status'],
                        statusColor: order['statusColor'],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: _buildTab(title: 'الكل', index: 0)),
          const SizedBox(width: 8),
          Expanded(child: _buildTab(title: 'قيد التنفيذ', index: 1)),
          const SizedBox(width: 8),
          Expanded(child: _buildTab(title: 'مكتملة', index: 2)),
        ],
      ),
    );
  }

  Widget _buildTab({required String title, required int index}) {
    final bool isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.grey.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppColors.black : AppColors.grey,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
