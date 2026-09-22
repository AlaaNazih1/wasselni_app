import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class TrackingHeader extends StatelessWidget {
  const TrackingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Row(
          children: [
           

            const Expanded(
              child: Center(
                child: Text(
                  'متابعة الطلب',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),

           
          ],
        ),
      ),
    );
  }
}
