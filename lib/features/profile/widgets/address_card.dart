import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.icon,
    required this.title,
    required this.address,
    required this.onEdit,
    required this.onDelete,
  });

  final IconData icon;
  final String title;
  final String address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 7, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.black, size: 23),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      address,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: Colors.black12),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: Text(l10n.delete),
                  style: TextButton.styleFrom(foregroundColor: AppColors.error),
                ),
              ),
              Container(width: 1, height: 24, color: Colors.black12),
              Expanded(
                child: TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: Text(l10n.edit),
                  style: TextButton.styleFrom(foregroundColor: AppColors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
