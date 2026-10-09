import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: const Icon(Icons.add_location_alt_outlined, size: 21),
        label: Text(
          l10n.addNewAddress,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
