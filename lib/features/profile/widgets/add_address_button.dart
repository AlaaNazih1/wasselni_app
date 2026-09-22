import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: const Icon(Icons.add_location_alt_outlined, size: 21),
        label: const Text(
          'إضافة عنوان جديد',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.black,
          backgroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
