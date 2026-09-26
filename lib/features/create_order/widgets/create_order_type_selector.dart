import 'package:flutter/material.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import 'package:wasselni/core/theme/app_colors.dart';

class CreateOrderTypeSelector extends StatelessWidget {
  const CreateOrderTypeSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.grey.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(child: _buildItem(title: l10n.pickupAndDelivery, index: 0)),
          Expanded(child: _buildItem(title: l10n.deliveryOnly, index: 1)),
        ],
      ),
    );
  }

  Widget _buildItem({required String title, required int index}) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onChanged(index),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
