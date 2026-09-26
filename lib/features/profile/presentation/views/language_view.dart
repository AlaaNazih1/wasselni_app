import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasselni/core/localization/language_controller.dart';
import 'package:wasselni/features/profile/widgets/language_header.dart';
import 'package:wasselni/features/profile/widgets/language_option.dart';

import '../../../../core/theme/app_colors.dart';

class LanguageView extends ConsumerWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(languageProvider);

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
                  const Text(
                    'اختر اللغة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  LanguageOption(
                    title: 'العربية',
                    subtitle: 'العربية',
                    isSelected: currentLocale.languageCode == 'ar',
                    onTap: () {
                      ref.read(languageProvider.notifier).changeLanguage('ar');
                    },
                  ),

                  LanguageOption(
                    title: 'English',
                    subtitle: 'English',
                    isSelected: currentLocale.languageCode == 'en',
                    onTap: () {
                      ref.read(languageProvider.notifier).changeLanguage('en');
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
