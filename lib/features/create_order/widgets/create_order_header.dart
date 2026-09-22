import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';

class CreateOrderHeader extends StatelessWidget {
  const CreateOrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       

        const Expanded(
          child: Text(
            ' إنشاء طلب جديد',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),

        const SizedBox(width: 48),
      ],
    );
  }
}
