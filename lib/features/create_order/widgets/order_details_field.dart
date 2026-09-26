import 'package:flutter/material.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import 'package:wasselni/core/theme/app_colors.dart';

class OrderDetailsField extends StatelessWidget {
  const OrderDetailsField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.orderDetails,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          maxLines: 4,

          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return l10n.enterOrderDetails;
            }

            return null;
          },

          decoration: InputDecoration(
            hintText: l10n.orderDetailsHint,

            prefixIcon: const Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Icon(Icons.description_outlined, color: AppColors.primary),
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
