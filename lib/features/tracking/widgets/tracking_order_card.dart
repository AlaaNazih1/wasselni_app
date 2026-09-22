import 'package:flutter/material.dart';
import 'package:wasselni/features/order_details/presentation/views/order_details_view.dart';

import '../../../../core/theme/app_colors.dart';

class TrackingOrderCard extends StatelessWidget {
  const TrackingOrderCard({
    super.key,
    required this.orderNumber,
    required this.status,
    required this.statusColor,
    required this.from,
    required this.to,
    required this.price,
    required this.time,
   
  });

  final String orderNumber;
  final String status;
  final Color statusColor;
  final String from;
  final String to;
  final String price;
  final String time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
           Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsView(
              orderNumber: orderNumber,
              from: from,
              to: to,
              price: price,
              status: status,
              statusColor: statusColor,
            ),
          ),
        );
        },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          children: [
            // =========================
            // Order Number + Status
            // =========================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderNumber,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
      
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 12),
      
            const Divider(height: 1),
      
            const SizedBox(height: 12),
      
            // =========================
            // Route
            // =========================
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primary,
                  size: 21,
                ),
      
                const SizedBox(width: 8),
      
                Expanded(
                  child: Text(
                    '$from  →  $to',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
      
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 10),
      
            // =========================
            // Time
            // =========================
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                time,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
