import 'package:flutter/material.dart';
import 'package:wasselni/core/widgets/custom_button.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class AddressFormActions extends StatelessWidget {
  const AddressFormActions({
    super.key,
    required this.isSaving,
    required this.onSave,
  });

  final bool isSaving;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return CustomButton(
      text: isSaving ? l10n.savingAddress : l10n.saveAddress,
      onPressed: isSaving ? () {} : onSave,
    );
  }
}
