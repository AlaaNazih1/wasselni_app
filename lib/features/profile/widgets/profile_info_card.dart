import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasselni/features/profile/presentation/controllers/profile_controller.dart';

import '../../../../core/theme/app_colors.dart';

class ProfileInfoCard extends ConsumerWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          return const SizedBox(
            height: 180,
            child: Center(
              child: Text(
                'حدث خطأ في تحميل البيانات',
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
            return const SizedBox(
              height: 180,
              child: Center(
                child: Text(
                  'لا توجد بيانات للمستخدم',
                  style: TextStyle(color: AppColors.grey),
                ),
              ),
            );
          }

          final name = userData['name'] ?? '';
          final phone = userData['phone'] ?? '';
          final email = userData['email'] ?? '';

          return Column(
            children: [
              // Profile Image
              CircleAvatar(
                radius: 42,
                backgroundColor: AppColors.primary,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/wasselni_logo-removebg-preview.png',
                    width: 84,
                    height: 84,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Name
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 5),

              // Phone
              Text(
                phone,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 3),

              // Email
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
