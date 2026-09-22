import 'package:flutter/material.dart';
import 'package:wasselni/features/profile/widgets/edit_profile_form.dart';
import 'package:wasselni/features/profile/widgets/edit_profile_header.dart';
import 'package:wasselni/features/profile/widgets/edit_profile_image.dart';

import '../../../../core/theme/app_colors.dart';


class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const EditProfileHeader(),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const EditProfileImage(),

                  const SizedBox(height: 24),

                  const EditProfileForm(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
