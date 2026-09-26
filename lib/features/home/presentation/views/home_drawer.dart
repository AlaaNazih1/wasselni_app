import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasselni/core/utils/logout_helper.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../profile/presentation/controllers/profile_controller.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);
    final l10n = AppLocalizations.of(context);

    return Drawer(
      backgroundColor: AppColors.background,
      width: MediaQuery.of(context).size.width * 0.78,
      child: SafeArea(
        child: Column(
          children: [
            profileAsync.when(
              loading: () => const SizedBox(
                height: 190,
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              ),

              error: (error, stackTrace) => SizedBox(
                height: 190,
                child: Center(
                  child: Text(
                    l10n.profileLoadError,
                    style: const TextStyle(
                      color: AppColors.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              data: (userData) {
                if (userData == null) {
                  return SizedBox(
                    height: 190,
                    child: Center(
                      child: Text(
                        l10n.noUserData,
                        style: const TextStyle(color: AppColors.grey),
                      ),
                    ),
                  );
                }

                return _buildUserInfo(
                  name: userData['name'] ?? '',
                  phone: userData['phone'] ?? '',
                  email: userData['email'] ?? '',
                  profileImageBase64: userData['profileImageBase64'],
                );
              },
            ),

            const SizedBox(height: 20),

            const Divider(
              height: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.black12,
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _DrawerItem(
                    icon: Icons.person_outline,
                    title: l10n.profile,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  _DrawerItem(
                    icon: Icons.receipt_long_outlined,
                    title: l10n.myOrders,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  _DrawerItem(
                    icon: Icons.location_on_outlined,
                    title: l10n.trackOrder,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  _DrawerItem(
                    icon: Icons.notifications_none,
                    title: l10n.notifications,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: _DrawerItem(
                      icon: Icons.logout,
                      title: l10n.logout,
                      onTap: () {
                        LogoutHelper.showLogoutDialog(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo({
    required String name,
    required String phone,
    required String email,
    required dynamic profileImageBase64,
  }) {
    ImageProvider? profileImage;

    if (profileImageBase64 != null &&
        profileImageBase64.toString().isNotEmpty) {
      try {
        profileImage = MemoryImage(base64Decode(profileImageBase64.toString()));
      } catch (e) {
        debugPrint('DRAWER IMAGE DECODE ERROR: $e');
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 42,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            backgroundImage: profileImage,
            child: profileImage == null
                ? ClipOval(
                    child: Image.asset(
                      'assets/images/wasselni_logo-removebg-preview.png',
                      width: 84,
                      height: 84,
                      fit: BoxFit.cover,
                    ),
                  )
                : null,
          ),

          const SizedBox(height: 12),

          Text(
            name,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            phone,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            email,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon, color: AppColors.black, size: 21),
        ),
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new,
          size: 14,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
