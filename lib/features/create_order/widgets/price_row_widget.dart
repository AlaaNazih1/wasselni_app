import 'package:flutter/material.dart';
import 'package:wasselni/core/theme/app_colors.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({super.key, 
    required this.title,
    required this.value,
    this.subtitle,
    this.isTotal = false,
  });

  final String title;
  final String value;
  final String? subtitle;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isTotal ? 18 : 15,
                fontWeight: isTotal ? FontWeight.w900 : FontWeight.w700,
                color: AppColors.black,
              ),
            ),

            if (subtitle != null) ...[
              const SizedBox(width: 5),

              Text(
                subtitle!,
                style: const TextStyle(color: AppColors.grey, fontSize: 12),
              ),
            ],
          ],
        ),

        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 19 : 15,
            fontWeight: FontWeight.w900,
            color: isTotal ? AppColors.primary : AppColors.black,
          ),
        ),
      ],
    );
  }
}
