import 'package:flutter/material.dart';
import 'package:wasselni/core/theme/app_colors.dart';

class AddressFormFieldTitle extends StatelessWidget {
  const AddressFormFieldTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
    );
  }
}
