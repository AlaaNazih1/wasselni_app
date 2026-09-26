import 'package:flutter/material.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import '../../../../core/theme/app_colors.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        child: Container(
          height: 155,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              // Text
              Positioned(
                right: 20,
                top: 25,
                child: SizedBox(
                  width: isEnglish ? 190 : 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.alwaysAhead,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: isEnglish ? 23 : 30,
                          height: 1.1,
                          fontWeight: FontWeight.w900,
                          color: AppColors.black,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        l10n.oneStepAhead,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: isEnglish ? 21 : 27,
                          height: 1.1,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Motorcycle
              Positioned(
                left: 10,
                bottom: 10,
                child: Image.asset(
                  'assets/images/Motorcycle_artwork-removebg-preview.png',
                  width: 115,
                  height: 115,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
