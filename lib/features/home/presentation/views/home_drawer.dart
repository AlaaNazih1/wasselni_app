import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      width: MediaQuery.of(context).size.width * 0.78,
      child: SafeArea(
        child: Column(
          children: [
            // User information
            _buildUserInfo(),

            const SizedBox(height: 20),

            const Divider(
              height: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.black12,
            ),

            const SizedBox(height: 12),

            // Navigation items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _DrawerItem(
                    icon: Icons.person_outline,
                    title: 'حسابي',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  _DrawerItem(
                    icon: Icons.receipt_long_outlined,
                    title: 'طلباتي',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  _DrawerItem(
                    icon: Icons.location_on_outlined,
                    title: 'تتبع الطلب',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  _DrawerItem(
                    icon: Icons.notifications_none,
                    title: 'الإشعارات',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      child: Column(
        children: [
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

          const Text(
            'علاء نزيه',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            '01000000000',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
          ),

          const SizedBox(height: 3),

          const Text(
            'alaa@example.com',
            style: TextStyle(
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
