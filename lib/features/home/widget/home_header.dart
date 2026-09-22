import 'package:flutter/material.dart';
import 'package:wasselni/features/profile/presentation/views/notifications_view.dart';

import '../../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
          children: [
            // Menu
           Builder(
              builder: (context) {
                return Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu, color: AppColors.black),
                  ),
                );
              },
            ),

            const SizedBox(width: 12),

            // Logo
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/wasselni_logo-removebg-preview.png',
                    width: 42,
                    height: 42,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Wasselni',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Notification
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                   Center(
                    child: IconButton(
                      icon: Icon(Icons.notifications_none),
                      color: AppColors.black,
                      onPressed: (){
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const NotificationsView(),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
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
}
