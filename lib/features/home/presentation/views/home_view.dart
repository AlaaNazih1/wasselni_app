import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // =========================
            // App Bar
            // =========================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    // Menu
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.menu, color: AppColors.black),
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
                          const Center(
                            child: Icon(
                              Icons.notifications_none,
                              color: AppColors.black,
                              size: 25,
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
            ),

            // =========================
            // Greeting
            // =========================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'أهلاً بك ',
                      style: TextStyle(fontSize: 15, color: AppColors.grey),
                    ),
                    Text(
                      'علاء',
                      style: TextStyle(fontSize: 30, color: AppColors.black, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 4),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'اطلب اللي محتاجه بسهولة',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =========================
            // Categories
            // =========================
            SliverToBoxAdapter(
              child: SizedBox(
                height: 105,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _CategoryItem(
                      icon: Icons.shopping_cart_outlined,
                      title: 'طلبات',
                    ),
                    _CategoryItem(
                      icon: Icons.restaurant_outlined,
                      title: 'مطاعم',
                    ),
                    _CategoryItem(
                      icon: Icons.medical_services_outlined,
                      title: 'صيدليات',
                    ),
                    _CategoryItem(
                      icon: Icons.storefront_outlined,
                      title: 'متاجر',
                    ),
                  ],
                ),
              ),
            ),

            // =========================
            // Banner
            // =========================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                child: Container(
                  height: 155,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                       right: 20,
                        top: 22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'مع وصلني دائماً',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'سابقين بخطوة',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        left: 20,
                        top: 22,
                        child: Image.asset(
                          'assets/images/Motorcycle_artwork-removebg-preview.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // =========================
            // Latest Orders Header
            // =========================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'آخر الطلبات',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'عرض الكل',
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =========================
            // Order Card
            // =========================
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate(const [
                  _OrderCard(
                    orderNumber: '#1258',
                    from: 'ديروط',
                    to: 'أسيوط',
                    price: '80 جنيه',
                    status: 'تم التسليم',
                    statusColor: AppColors.success,
                  ),
                  SizedBox(height: 12),
                  _OrderCard(
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

// =====================================================
// Category
// =====================================================

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      margin: const EdgeInsets.only(left: 8),
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.black, size: 27),
          ),
          const SizedBox(height: 7),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// Order Card
// =====================================================

class _OrderCard extends StatelessWidget {
  const _OrderCard({
    required this.orderNumber,
    required this.from,
    required this.to,
    required this.price,
    required this.status,
    required this.statusColor,
  });

  final String orderNumber;
  final String from;
  final String to;
  final String price;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderNumber,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const Divider(height: 22),

          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: AppColors.primary),
              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  '$from  →  $to',
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),

              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
