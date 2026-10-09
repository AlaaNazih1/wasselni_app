import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/core/utils/logout_helper.dart';
import 'package:wasselni/features/profile/presentation/views/addresses_view.dart';
import 'package:wasselni/features/profile/presentation/views/edit_profile_view.dart';
import 'package:wasselni/features/profile/presentation/views/help_view.dart';
import 'package:wasselni/features/profile/presentation/views/language_view.dart';
import 'package:wasselni/features/profile/presentation/views/notifications_view.dart';
import 'package:wasselni/features/profile/widgets/profile_header.dart';
import 'package:wasselni/features/profile/widgets/profile_info_card.dart';
import 'package:wasselni/features/profile/widgets/profile_menu_item.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context);

    final selectedLanguage = currentLocale.languageCode == 'ar'
        ? l10n.arabic
        : l10n.english;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const ProfileHeader(),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const ProfileInfoCard(),
                  const SizedBox(height: 20),
                  Text(
                    l10n.settings,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  ProfileMenuItem(
                    icon: Icons.person_outline,
                    title: l10n.editProfile,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EditProfileView(),
                        ),
                      );
                    },
                  ),

                  ProfileMenuItem(
                    icon: Icons.location_on_outlined,
                    title: l10n.myAddresses,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AddressesView(),
                        ),
                      );
                    },
                  ),

                  ProfileMenuItem(
                    icon: Icons.notifications_none,
                    title: l10n.notifications,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NotificationsView(),
                        ),
                      );
                    },
                  ),

                  ProfileMenuItem(
                    icon: Icons.language,
                    title: l10n.language,
                    trailingText: selectedLanguage,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LanguageView()),
                      );
                    },
                  ),

                  ProfileMenuItem(
                    icon: Icons.help_outline,
                    title: l10n.help,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HelpView()),
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  ProfileMenuItem(
                    icon: Icons.logout,
                    title: l10n.logout,
                    iconColor: AppColors.error,
                    titleColor: AppColors.error,
                    onTap: () {
                      LogoutHelper.showLogoutDialog(context);
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
