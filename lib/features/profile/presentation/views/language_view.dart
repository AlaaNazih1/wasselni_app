import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wasselni/core/localization/language_controller.dart';
import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/features/profile/widgets/language_header.dart';
import 'package:wasselni/features/profile/widgets/language_option.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class LanguageView extends ConsumerWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(languageProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const LanguageHeader(),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text(
                    l10n.chooseLanguage,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  LanguageOption(
                    title: l10n.arabic,
                    subtitle: l10n.arabic,
                    isSelected: currentLocale.languageCode == 'ar',
                    onTap: () {
                      if (currentLocale.languageCode != 'ar') {
                        ref
                            .read(languageProvider.notifier)
                            .changeLanguage('ar');
                      }
                    },
                  ),
                  LanguageOption(
                    title: 'English',
                    subtitle: l10n.english,
                    isSelected: currentLocale.languageCode == 'en',
                    onTap: () {
                      if (currentLocale.languageCode != 'en') {
                        ref
                            .read(languageProvider.notifier)
                            .changeLanguage('en');
                      }
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
