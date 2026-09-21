import 'package:flutter/material.dart';
import 'package:wasselni/features/home/widget/home_banner.dart';
import 'package:wasselni/features/home/widget/home_categories.dart';
import 'package:wasselni/features/home/widget/home_greeting.dart';
import 'package:wasselni/features/home/widget/home_header.dart';
import 'package:wasselni/features/home/widget/latest_orders_header.dart';
import 'package:wasselni/features/home/widget/order_card.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const HomeHeader(),

            const HomeGreeting(),

            const HomeCategories(),

            const HomeBanner(),

            const LatestOrdersHeader(),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate(const [
                  OrderCard(
                    orderNumber: '#1258',
                    from: 'ديروط',
                    to: 'أسيوط',
                    price: '80 جنيه',
                    status: 'تم التسليم',
                    statusColor: Color(0xFF20A464),
                  ),

                  SizedBox(height: 12),

                  OrderCard(
                    orderNumber: '#1257',
                    from: 'ديروط',
                    to: 'أسيوط',
                    price: '80 جنيه',
                    status: 'في الطريق',
                    statusColor: Colors.blue,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
