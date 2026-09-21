import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.black,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w700,
    this.underline = true,
  });

  final String text;
  final VoidCallback? onPressed;

  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  final bool underline;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,

      style: TextButton.styleFrom(foregroundColor: color),

      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: underline
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
      ),
    );
  }
}
