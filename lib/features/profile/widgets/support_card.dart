import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

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
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.black, size: 21),
        ),
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 12, color: AppColors.grey),
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new,
          size: 14,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
