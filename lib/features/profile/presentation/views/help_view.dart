import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/features/profile/widgets/faq_item.dart';
import 'package:wasselni/features/profile/widgets/help_header.dart';
import 'package:wasselni/features/profile/widgets/support_card.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const HelpHeader(),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text(
                    l10n.faqTitle,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 12),

                  FaqItem(
                    question: l10n.faqCreateOrderQuestion,
                    answer: l10n.faqCreateOrderAnswer,
                  ),

                  FaqItem(
                    question: l10n.faqTrackOrderQuestion,
                    answer: l10n.faqTrackOrderAnswer,
                  ),

                  FaqItem(
                    question: l10n.faqEditProfileQuestion,
                    answer: l10n.faqEditProfileAnswer,
                  ),

                  FaqItem(
                    question: l10n.faqAddAddressQuestion,
                    answer: l10n.faqAddAddressAnswer,
                  ),

                  FaqItem(
                    question: l10n.faqOrderProblemQuestion,
                    answer: l10n.faqOrderProblemAnswer,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    l10n.contactUs,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 12),

                  SupportCard(
                    icon: Icons.phone_outlined,
                    title: l10n.callUs,
                    subtitle: l10n.supportWorkingHours,
                    onTap: () {},
                  ),

                  SupportCard(
                    icon: Icons.chat_outlined,
                    title: l10n.chatWithSupport,
                    subtitle: l10n.contactSupportDirectly,
                    onTap: () {},
                  ),

                  SupportCard(
                    icon: Icons.email_outlined,
                    title: l10n.email,
                    subtitle: 'support@wasselni.com',
                    onTap: () {},
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
