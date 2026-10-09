import 'package:flutter/material.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class OrderDetailsHeader extends StatelessWidget {
  const OrderDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Text(
      l10n.orderData,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    );
  }
}
