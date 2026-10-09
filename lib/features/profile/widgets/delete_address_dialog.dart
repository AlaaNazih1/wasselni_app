import 'package:flutter/material.dart';
import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class DeleteAddressDialog {
  const DeleteAddressDialog._();

  static Future<bool?> show(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(l10n.deleteAddress, textAlign: TextAlign.start),
          content: Text(l10n.confirmDeleteAddress, textAlign: TextAlign.start),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: Text(
                l10n.delete,
                style: const TextStyle(color: AppColors.error),
              ),
            ),
          ],
        );
      },
    );
  }
}
