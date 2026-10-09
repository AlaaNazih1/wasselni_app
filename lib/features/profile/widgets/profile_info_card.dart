import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasselni/features/profile/presentation/controllers/profile_controller.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import '../../../../core/theme/app_colors.dart';

class ProfileInfoCard extends ConsumerWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final profileAsync = ref.watch(profileProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: profileAsync.when(
        loading: () {
          return const SizedBox(
            height: 180,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        },

        error: (error, stackTrace) {
          return  SizedBox(
            height: 180,
            child: Center(
              child: Text(
                l10n.profileLoadError,
                style: TextStyle(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },

        data: (userData) {
          if (userData == null) {
            return  SizedBox(
              height: 180,
              child: Center(
                child: Text(
                  l10n.profileNoData,
                  style: TextStyle(color: AppColors.grey),
                ),
              ),
            );
          }

          final name = userData['name'] ?? '';
          final phone = userData['phone'] ?? '';
          final email = userData['email'] ?? '';

          final profileImageBase64 = userData['profileImageBase64'] as String?;

          final hasProfileImage =
              profileImageBase64 != null && profileImageBase64.isNotEmpty;

          return Column(
            children: [
              CircleAvatar(
                radius: 42,
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),

                backgroundImage: hasProfileImage
                    ? MemoryImage(base64Decode(profileImageBase64))
                    : null,

                child: !hasProfileImage
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
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                phone,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                email,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
