import 'package:flutter/material.dart';
import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/features/order_details/widgets/order_location_row.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class OrderTripDetails extends StatelessWidget {
  const OrderTripDetails({super.key, required this.from, required this.to});

  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.tripDetails,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              OrderLocationRow(title: l10n.from, value: from),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(),
              ),
              OrderLocationRow(title: l10n.to, value: to),
            ],
          ),
        ),
      ],
    );
  }
}
