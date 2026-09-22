import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailingText,
    this.iconColor,
    this.titleColor,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final String? trailingText;
  final Color? iconColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

        // Icon
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: (iconColor ?? AppColors.black).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor ?? AppColors.black, size: 21),
        ),

        // Title
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: titleColor ?? AppColors.black,
          ),
        ),

        // Trailing
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailingText != null) ...[
              Text(
                trailingText!,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
            ],
            Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: titleColor ?? AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
