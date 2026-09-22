import 'package:flutter/material.dart';
import 'package:wasselni/core/widgets/custom_text_button.dart';

class LatestOrdersHeader extends StatelessWidget {
  const LatestOrdersHeader({super.key, required this.onShowAllOrders});

  final VoidCallback onShowAllOrders;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'آخر الطلبات',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
            ),

            SizedBox(
              width: 100,
              child: CustomTextButton(text: 'عرض الكل', onPressed: onShowAllOrders),
            ),
          ],
        ),
      ),
    );
  }
}
