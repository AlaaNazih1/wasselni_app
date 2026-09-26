import 'package:flutter/material.dart';
import 'package:wasselni/core/theme/app_colors.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({super.key, 
    required this.title,
    required this.location,
    required this.icon,
  });

  final String title;
  final String location;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,

          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),

          child: Icon(icon, color: AppColors.black),
        ),

        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style: const TextStyle(color: AppColors.grey, fontSize: 12),
            ),

            const SizedBox(height: 3),

            Text(
              location,
              style: const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
