import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wasselni/features/create_order/widgets/location_row_widget.dart';
import 'package:wasselni/features/create_order/widgets/price_row_widget.dart';
import 'package:wasselni/l10n/app_localizations.dart';

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

    final l10n = AppLocalizations.of(context);
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.loginRequired),
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

      final orderDoc = ordersRef.doc();

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
        'status': 'تم استلام الطلب',
        'driverName': '',
        'driverId': '',
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.orderConfirmedSuccessfully),
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
          content: Text(l10n.orderCreationError(e.toString())),
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
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: Text(
          l10n.priceDetails,
          style: const TextStyle(fontWeight: FontWeight.w900),
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
                          LocationRow(
                            title: l10n.pickupLocation,
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

                        LocationRow(
                          title: l10n.deliveryLocation,
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

            PriceRow(
              title: l10n.deliveryPrice,
              value:
                  '${deliveryPrice.toStringAsFixed(0)} ${l10n.currency}',
            ),

            const SizedBox(height: 16),

            PriceRow(
              title: l10n.additionalFees,
              subtitle: l10n.ifAny,
              value:
                  '${additionalFees.toStringAsFixed(0)} ${l10n.currency}',
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(),
            ),

            PriceRow(
              title: l10n.totalAmount,
              value: '${totalPrice.toStringAsFixed(0)} ${l10n.currency}',
              isTotal: true,
            ),

            const SizedBox(height: 30),

            CustomButton(
              text: _isLoading ? l10n.creatingOrder : l10n.confirmOrder,
              onPressed: _isLoading ? null : _confirmOrder,
            ),
          ],
        ),
      ),
    );
  }
}

