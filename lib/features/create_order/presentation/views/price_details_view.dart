import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/core/widgets/custom_button.dart';
import 'package:wasselni/features/home/presentation/views/main_navigation_view.dart';

class PriceDetailsView extends StatefulWidget {
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

  @override
  State<PriceDetailsView> createState() => _PriceDetailsViewState();
}

class _PriceDetailsViewState extends State<PriceDetailsView> {
  static const double basePrice = 30;
  static const double pricePerKm = 5;
  static const double additionalFees = 0;

  bool _isLoading = false;

  double get deliveryPrice {
    return basePrice + (pricePerKm * widget.distance);
  }

  double get totalPrice {
    return deliveryPrice + additionalFees;
  }

  Future<void> _confirmOrder() async {
    if (_isLoading) return;

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يجب تسجيل الدخول أولاً'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final ordersRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('orders');

      // إنشاء Document جديد والحصول على الـ ID
      final orderDoc = ordersRef.doc();

      // رقم الطلب
      final orderNumber =
          '#${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

      await orderDoc.set({
        'orderNumber': orderNumber,
        'userId': user.uid,

        'from': widget.from,
        'to': widget.to,

        'orderType': widget.orderType,

        'distance': widget.distance,

        'deliveryPrice': deliveryPrice,
        'additionalFees': additionalFees,
        'totalPrice': totalPrice,

        // الحالة الأولية للطلب
        'status': 'تم استلام الطلب',

        'driverName': '',
        'driverId': '',

        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم تأكيد الطلب بنجاح'),
          backgroundColor: AppColors.success,
        ),
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigationView()),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء إنشاء الطلب: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
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
                        if (widget.orderType == 0)
                          _LocationRow(
                            title: 'مكان الاستلام',
                            location: widget.from,
                            icon: Icons.location_on_outlined,
                          ),

                        if (widget.orderType == 0)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Icon(
                              Icons.arrow_downward,
                              color: AppColors.primary,
                            ),
                          ),

                        _LocationRow(
                          title: 'مكان التوصيل',
                          location: widget.to,
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
              text: _isLoading ? 'جاري إنشاء الطلب...' : 'تأكيد الطلب',
              onPressed: _isLoading ? null : _confirmOrder,
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
