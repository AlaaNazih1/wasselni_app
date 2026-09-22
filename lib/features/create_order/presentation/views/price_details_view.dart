import 'package:flutter/material.dart';
import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/core/widgets/custom_button.dart';
import 'package:wasselni/features/home/presentation/views/main_navigation_view.dart';

class PriceDetailsView extends StatelessWidget {
  const PriceDetailsView({
    super.key,
    required this.from,
    required this.to,
    required this.distance,
    required this.orderType,
  });

  final String from;
  final String to;
  final double distance;
final int orderType;
  static const double basePrice = 30;
  static const double pricePerKm = 5;
  static const double additionalFees = 0;

  double get deliveryPrice {
    return basePrice + (pricePerKm * distance);
  }

  double get totalPrice {
    return deliveryPrice + additionalFees;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'تفاصيل السعر',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image.asset(
                      'assets/images/Motorcycle_artwork-removebg-preview.png',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                   if (orderType == 0)
                          _LocationRow(
                            title: 'مكان الاستلام',
                            location: from,
                            icon: Icons.location_on_outlined,
                          ),

                        if (orderType == 0)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Icon(
                              Icons.arrow_downward,
                              color: AppColors.primary,
                            ),
                          ),

                        _LocationRow(
                          title: 'مكان التوصيل',
                          location: to,
                          icon: Icons.location_on_outlined,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _PriceRow(
              title: 'سعر التوصيل',
              value: '${deliveryPrice.toStringAsFixed(0)} جنيه',
            ),

            const SizedBox(height: 16),

            _PriceRow(
              title: 'رسوم إضافية',
              subtitle: '(إن وجدت)',
              value: '${additionalFees.toStringAsFixed(0)} جنيه',
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(),
            ),

            _PriceRow(
              title: 'إجمالي المبلغ',
              value: '${totalPrice.toStringAsFixed(0)} جنيه',
              isTotal: true,
            ),

            const SizedBox(height: 30),

            CustomButton(
              text: 'تأكيد الطلب',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم تأكيد الطلب بنجاح'),
                    backgroundColor: AppColors.success,
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MainNavigationView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationRow extends StatelessWidget {
  const _LocationRow({
    required this.title,
    required this.location,
    required this.icon,
  });

  final String title;
  final String location;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.black),
        ),

        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: AppColors.grey, fontSize: 12),
            ),
            const SizedBox(height: 3),
            Text(
              location,
              style: const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow({
    required this.title,
    required this.value,
    this.subtitle,
    this.isTotal = false,
  });

  final String title;
  final String value;
  final String? subtitle;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isTotal ? 18 : 15,
                fontWeight: isTotal ? FontWeight.w900 : FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(width: 5),
              Text(
                subtitle!,
                style: const TextStyle(color: AppColors.grey, fontSize: 12),
              ),
            ],
          ],
        ),

        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 19 : 15,
            fontWeight: FontWeight.w900,
            color: isTotal ? AppColors.primary : AppColors.black,
          ),
        ),
      ],
    );
  }
}
