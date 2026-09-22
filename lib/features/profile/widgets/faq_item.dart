import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class FaqItem extends StatelessWidget {
  const FaqItem({super.key, required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 7, offset: Offset(0, 2)),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        iconColor: AppColors.black,
        collapsedIconColor: AppColors.grey,
        title: Text(
          question,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.black,
          ),
        ),
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              answer,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 13,
                height: 1.5,
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
