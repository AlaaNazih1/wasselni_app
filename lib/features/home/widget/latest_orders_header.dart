import 'package:flutter/material.dart';
import 'package:wasselni/core/widgets/custom_text_button.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class LatestOrdersHeader extends StatelessWidget {
  const LatestOrdersHeader({super.key, required this.onShowAllOrders});

  final VoidCallback onShowAllOrders;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.latestOrders,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
            ),

            SizedBox(
              width: 100,
              child: CustomTextButton(
                text: l10n.viewAll,
                onPressed: onShowAllOrders,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
