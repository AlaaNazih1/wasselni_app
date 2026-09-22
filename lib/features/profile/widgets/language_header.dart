import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class LanguageHeader extends StatelessWidget {
  const LanguageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 19,
                  color: AppColors.black,
                ),
              ),
            ),

            const SizedBox(width: 12),

            const Expanded(
              child: Text(
                'اللغة',
                textAlign: TextAlign.right,
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
