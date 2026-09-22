import 'package:flutter/material.dart';
import 'package:wasselni/features/profile/widgets/language_header.dart';
import 'package:wasselni/features/profile/widgets/language_option.dart';

import '../../../../core/theme/app_colors.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  String selectedLanguage = 'العربية';

  @override
  Widget build(BuildContext context) {
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
                    isSelected: selectedLanguage == 'العربية',
                    onTap: () {
                      setState(() {
                        selectedLanguage = 'العربية';
                      });
                    },
                  ),

                  LanguageOption(
                    title: 'English',
                    subtitle: 'English',
                    isSelected: selectedLanguage == 'English',
                    onTap: () {
                      setState(() {
                        selectedLanguage = 'English';
                      });
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
