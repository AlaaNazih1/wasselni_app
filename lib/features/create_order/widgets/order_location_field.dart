import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';

class OrderLocationField extends StatelessWidget {
  const OrderLocationField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,

          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'من فضلك أدخل $title';
            }

            return null;
          },

          decoration: InputDecoration(
            hintText: hintText,

            prefixIcon: const Icon(
              Icons.location_on_outlined,
              color: AppColors.primary,
            ),

            filled: true,
            fillColor: AppColors.white,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: AppColors.grey.withValues(alpha: 0.2),
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
