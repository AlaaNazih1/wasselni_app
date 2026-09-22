import 'package:flutter/material.dart';
import 'package:wasselni/features/profile/widgets/add_address_button.dart';
import 'package:wasselni/features/profile/widgets/address_card.dart';
import 'package:wasselni/features/profile/widgets/addresses_header.dart';

import '../../../../core/theme/app_colors.dart';


class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const AddressesHeader(),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Text(
                    'العناوين المحفوظة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  AddressCard(
                    icon: Icons.home_outlined,
                    title: 'المنزل',
                    address: 'ديروط - أسيوط',
                    onEdit: () {},
                    onDelete: () {},
                  ),

                  AddressCard(
                    icon: Icons.work_outline,
                    title: 'العمل',
                    address: 'أسيوط - شارع الجمهورية',
                    onEdit: () {},
                    onDelete: () {},
                  ),

                  const SizedBox(height: 10),

                  AddAddressButton(onTap: () {}),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
