import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
        child: Row(
          children: [
         

         

            // Title
            const Expanded(
              child: Text(
                'حسابي',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: AppColors.black,
                ),
              ),
            ),

            const SizedBox(width: 42),
          ],
        ),
      ),
    );
  }
}
