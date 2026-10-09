import 'package:flutter/material.dart';
import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class AddressTypeDropdown extends StatelessWidget {
  const AddressTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.location_on_outlined),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
      items: [
        DropdownMenuItem(value: 'home', child: Text(l10n.addressTypeHome)),
        DropdownMenuItem(value: 'work', child: Text(l10n.addressTypeWork)),
        DropdownMenuItem(value: 'other', child: Text(l10n.addressTypeOther)),
      ],
      onChanged: (newValue) {
        if (newValue != null) {
          onChanged(newValue);
        }
      },
    );
  }
}
