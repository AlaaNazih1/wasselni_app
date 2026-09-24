import 'package:flutter/material.dart';
import 'package:wasselni/core/utils/logout_helper.dart';
import 'package:wasselni/features/profile/presentation/views/addresses_view.dart';
import 'package:wasselni/features/profile/presentation/views/edit_profile_view.dart';
import 'package:wasselni/features/profile/presentation/views/help_view.dart';
import 'package:wasselni/features/profile/presentation/views/language_view.dart';
import 'package:wasselni/features/profile/presentation/views/notifications_view.dart';
import 'package:wasselni/features/profile/widgets/profile_header.dart';
import 'package:wasselni/features/profile/widgets/profile_info_card.dart';
import 'package:wasselni/features/profile/widgets/profile_menu_item.dart';

import '../../../../core/theme/app_colors.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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

                  const Text(
                    'الإعدادات',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 10),

              ProfileMenuItem(
                    icon: Icons.person_outline,
                    title: 'تعديل البيانات',
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
                    title: 'عناويني',
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
                    title: 'الإشعارات',
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
                    title: 'اللغة',
                    trailingText: 'العربية',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LanguageView(),
                        ),
                      );
                    },
                  ),

                  ProfileMenuItem(
                    icon: Icons.help_outline,
                    title: 'المساعدة',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HelpView(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  ProfileMenuItem(
                    icon: Icons.logout,
                    title: 'تسجيل الخروج',
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
