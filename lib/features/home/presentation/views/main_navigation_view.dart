import 'package:flutter/material.dart';
import 'package:wasselni/features/create_order/presentation/views/create_order_view.dart';
import 'package:wasselni/features/profile/presentation/views/profile_view.dart';
import 'package:wasselni/features/tracking/presentation/views/tracking_view.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import '../../../../core/theme/app_colors.dart';
import 'home_view.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int currentIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      HomeView(
        onShowAllOrders: () {
          setState(() {
            currentIndex = 1;
          });
        },
      ),
      const TrackingView(),
      const CreateOrderView(),
      const ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),

        child: SafeArea(
          child: BottomNavigationBar(
            currentIndex: currentIndex,

            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            elevation: 0,

            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey,

            selectedFontSize: 12,
            unselectedFontSize: 11,

            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home),
                label: l10n.home,
              ),

              BottomNavigationBarItem(
                icon: const Icon(Icons.receipt_long_outlined),
                activeIcon: const Icon(Icons.receipt_long),
                label: l10n.myOrders,
              ),

              BottomNavigationBarItem(
                icon: const Icon(Icons.add_circle_outline),
                activeIcon: const Icon(Icons.add_circle),
                label: l10n.newOrder,
              ),

              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                activeIcon: const Icon(Icons.person),
                label: l10n.profile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
