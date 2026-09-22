import 'package:flutter/material.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/core/widgets/custom_button.dart';
import 'package:wasselni/features/create_order/presentation/views/price_details_view.dart';
import 'package:wasselni/features/create_order/widgets/create_order_header.dart';
import 'package:wasselni/features/create_order/widgets/create_order_type_selector.dart';
import 'package:wasselni/features/create_order/widgets/order_details_field.dart';
import 'package:wasselni/features/create_order/widgets/order_location_field.dart';

class CreateOrderView extends StatefulWidget {
  const CreateOrderView({super.key});

  @override
  State<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends State<CreateOrderView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  int selectedOrderType = 0;

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    detailsController.dispose();
    priceController.dispose();

    super.dispose();
  }

  void createOrder() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم إنشاء الطلب بنجاح'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Form(
          key: formKey,

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CreateOrderHeader(),

                const SizedBox(height: 20),

                CreateOrderTypeSelector(
                  selectedIndex: selectedOrderType,
                  onChanged: (index) {
                    setState(() {
                      selectedOrderType = index;
                    });
                  },
                ),

                const SizedBox(height: 24),

                // استلام وتوصيل
                if (selectedOrderType == 0) ...[
                  OrderLocationField(
                    title: 'من (عنوان الاستلام)',
                    hintText: 'مثال: ديروط',
                    controller: fromController,
                  ),

                  const SizedBox(height: 18),

                  OrderLocationField(
                    title: 'إلى (عنوان التسليم)',
                    hintText: 'مثال: أسيوط',
                    controller: toController,
                  ),
                ]
                // توصيل فقط
                else ...[
                  OrderLocationField(
                    title: 'إلى (عنوان التسليم)',
                    hintText: 'مثال: أسيوط',
                    controller: toController,
                  ),
                ],

                const SizedBox(height: 18),

                OrderDetailsField(controller: detailsController),

                const SizedBox(height: 18),

                

                const SizedBox(height: 30),

                CustomButton(
                  text: 'متابعة',
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PriceDetailsView(
                          from: fromController.text,
                          to: toController.text,
                          distance: 10,
                            orderType: selectedOrderType
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
