import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Profile Image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
              border: Border.all(color: AppColors.primary, width: 3),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/wasselni_logo-removebg-preview.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Camera Button
          Positioned(
            bottom: 0,
            right: -2,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 3),
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 17,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
