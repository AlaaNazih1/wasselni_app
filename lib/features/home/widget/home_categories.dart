import 'package:flutter/material.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import '../../../../core/theme/app_colors.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 105,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          children: [
            _CategoryItem(
              icon: Icons.shopping_cart_outlined,
              title: l10n.orders,
            ),
            _CategoryItem(
              icon: Icons.restaurant_outlined,
              title: l10n.restaurants,
            ),
            _CategoryItem(
              icon: Icons.medical_services_outlined,
              title: l10n.pharmacies,
            ),
            _CategoryItem(icon: Icons.storefront_outlined, title: l10n.stores),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      margin: const EdgeInsets.only(left: 8),
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.black, size: 27),
          ),

          const SizedBox(height: 7),

          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
