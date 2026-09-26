import 'package:flutter/material.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import 'package:wasselni/core/theme/app_colors.dart';

class CreateOrderHeader extends StatelessWidget {
  const CreateOrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.createNewOrder,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),

        const SizedBox(width: 48),
      ],
    );
  }
}
