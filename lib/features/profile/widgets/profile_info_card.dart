import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
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
          const Text(
            'علاء نزيه',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 5),

          // Phone
          const Text(
            '01000000000',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 3),

          // Email
          const Text(
            'alaa@example.com',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
