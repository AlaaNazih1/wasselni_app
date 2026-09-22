import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class DeliveryDriverCard extends StatelessWidget {
  const DeliveryDriverCard({
    super.key,
    required this.driverName,
    required this.driverImage,
  });

  final String driverName;
  final String driverImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          // =========================
          // Driver
          // =========================
          CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.primary,
            backgroundImage: AssetImage(driverImage,),
          ),

          const SizedBox(height: 10),

          Text(
            driverName,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 3),

          const Text(
            'مندوب توصيل',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          // =========================
          // Actions
          // =========================
          Row(
            children: [
              Expanded(
                child: _DriverActionButton(
                  icon: Icons.phone,
                  title: 'اتصال',
                  color: AppColors.success,
                  onTap: () {
                    // هنربط الاتصال بعدين.
                  },
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _DriverActionButton(
                  icon: Icons.chat,
                  title: 'WhatsApp',
                  color: const Color(0xFF25D366),
                  onTap: () {
                    // هنربط WhatsApp بعدين.
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DriverActionButton extends StatelessWidget {
  const _DriverActionButton({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 19, color: color),
        label: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w800,
            fontSize: 13,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color.withValues(alpha: 0.35)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
