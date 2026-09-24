import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/features/tracking/widgets/order_timeline.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.orderId});

  final String orderId;
  

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

  @override
  Widget build(BuildContext context) {
      final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('يجب تسجيل الدخول أولاً')),
      );
    }
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          'بيانات الطلب',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),

      body: StreamBuilder<DocumentSnapshot>(
        
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('orders')
            .doc(orderId)
            .snapshots(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('الطلب غير موجود'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          final status = data['status'] ?? 'pending';

          final statusColor = _getStatusColor(status);

          final statusText = _getStatusText(status);

          final orderNumber = data['orderNumber'] ?? '';

          final from = data['from'] ?? '';

          final to = data['to'] ?? '';

          final price = data['totalPrice'] ?? 0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        orderNumber,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),

                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Text(
                          statusText,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'تفاصيل الرحلة',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
                ),

                const SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Column(
                    children: [
                      _LocationRow(title: 'من', value: from),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(),
                      ),

                      _LocationRow(title: 'إلى', value: to),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'السعر',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
                ),

                const SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      const Text(
                        'إجمالي الطلب',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        '$price جنيه',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

               OrderTimeline(
                  status: status,
                  createdAt: data['createdAt'],
                  inProgressAt: data['inProgressAt'],
                  deliveredAt: data['deliveredAt'],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LocationRow extends StatelessWidget {
  const _LocationRow({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: AppColors.primary, size: 28),

        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.grey.withOpacity(0.8),
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              value,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
