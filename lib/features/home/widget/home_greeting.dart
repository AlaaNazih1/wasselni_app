import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HomeGreeting extends StatelessWidget {
  const HomeGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              'أهلاً بك ',
              style: TextStyle(fontSize: 15, color: AppColors.grey),
            ),
            Text(
              'علاء',
              style: TextStyle(
                fontSize: 30,
                color: AppColors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'اطلب اللي محتاجه بسهولة',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
