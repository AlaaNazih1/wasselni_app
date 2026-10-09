import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/features/order_details/widgets/order_details_header.dart';
import 'package:wasselni/features/order_details/widgets/order_price_card.dart';
import 'package:wasselni/features/order_details/widgets/order_status_card.dart';
import 'package:wasselni/features/order_details/widgets/order_trip_details.dart';

import 'package:wasselni/features/tracking/widgets/order_timeline.dart';
import 'package:wasselni/l10n/app_localizations.dart';

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

  String _getStatusText(String status, AppLocalizations l10n) {
    switch (status) {
      case 'pending':
      case 'تم استلام الطلب':
        return l10n.statusPending;

      case 'inProgress':
      case 'في الطريق':
        return l10n.statusInProgress;

      case 'delivered':
      case 'تم التسليم':
        return l10n.statusDelivered;

      case 'cancelled':
      case 'ملغي':
        return l10n.statusCancelled;

      default:
        return l10n.unknownStatus;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: Text(l10n.loginRequired)),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const OrderDetailsHeader(),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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

          if (snapshot.hasError) {
            return const Center(
              child: Icon(
                Icons.error_outline,
                color: AppColors.error,
                size: 40,
              ),
            );
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text(l10n.orderNotFound));
          }

          final data = snapshot.data!.data();

          if (data == null) {
            return Center(child: Text(l10n.orderNotFound));
          }

          final status = (data['status'] ?? 'pending').toString();
          final statusColor = _getStatusColor(status);
          final statusText = _getStatusText(status, l10n);

          final orderNumber = (data['orderNumber'] ?? '').toString();

          final from = (data['from'] ?? '').toString();
          final to = (data['to'] ?? '').toString();
          final price = data['totalPrice'] ?? 0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderStatusCard(
                  orderNumber: orderNumber,
                  statusText: statusText,
                  statusColor: statusColor,
                ),
                const SizedBox(height: 20),
                OrderTripDetails(from: from, to: to),
                const SizedBox(height: 20),
                OrderPriceCard(price: price),
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
