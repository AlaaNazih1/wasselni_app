import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class OrderTimeline extends StatelessWidget {
  const OrderTimeline({
    super.key,
    required this.status,
    this.createdAt,
    this.inProgressAt,
    this.deliveredAt,
  });

  final String status;
  final dynamic createdAt;
  final dynamic inProgressAt;
  final dynamic deliveredAt;

  bool get isReceived {
    return status == 'pending' ||
        status == 'تم استلام الطلب' ||
        status == 'inProgress' ||
        status == 'في الطريق' ||
        status == 'delivered' ||
        status == 'تم التسليم';
  }

  bool get isOnTheWay {
    return status == 'inProgress' ||
        status == 'في الطريق' ||
        status == 'delivered' ||
        status == 'تم التسليم';
  }

  bool get isDelivered {
    return status == 'delivered' || status == 'تم التسليم';
  }

  String formatTime(BuildContext context, dynamic value) {
    if (value == null || value is! Timestamp) {
      return '--';
    }

    final l10n = AppLocalizations.of(context);
    final date = value.toDate();
    final isArabic = l10n.localeName == 'ar';

    final hour = date.hour == 0
        ? 12
        : date.hour > 12
        ? date.hour - 12
        : date.hour;

    final minute = date.minute.toString().padLeft(2, '0');

    final period = date.hour >= 12
        ? (isArabic ? 'م' : 'PM')
        : (isArabic ? 'ص' : 'AM');

    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.orderStatus,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 20),

          _TimelineItem(
            title: l10n.statusPending,
            time: formatTime(context, createdAt),
            color: AppColors.success,
            isCompleted: isReceived,
            isLast: false,
          ),

          _TimelineItem(
            title: l10n.onTheWayForDelivery,
            time: isOnTheWay ? formatTime(context, inProgressAt) : '--',
            color: Colors.blue,
            isCompleted: isOnTheWay,
            isLast: false,
          ),

          _TimelineItem(
            title: l10n.statusDelivered,
            time: isDelivered ? formatTime(context, deliveredAt) : '--',
            color: AppColors.success,
            isCompleted: isDelivered,
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.title,
    required this.time,
    required this.color,
    required this.isCompleted,
    required this.isLast,
  });

  final String title;
  final String time;
  final Color color;
  final bool isCompleted;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            child: Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isCompleted ? color : AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: color, width: 2),
                  ),
                  child: isCompleted
                      ? const Icon(
                          Icons.check,
                          size: 10,
                          color: AppColors.white,
                        )
                      : null,
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: AppColors.grey.withValues(alpha: 0.3),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isCompleted
                            ? FontWeight.w800
                            : FontWeight.w600,
                        color: isCompleted ? AppColors.black : AppColors.grey,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
