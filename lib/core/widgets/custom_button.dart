import 'package:flutter/material.dart';

import '../utils/spaces.dart';
import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? textSize;
  final void Function()? onPressed;
  final BorderRadiusGeometry? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.textSize,
    required this.onPressed,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(
                  AppSpaces.kBorderRadius15,
                ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.textStyle18.copyWith(
            color: textColor,
            fontSize: textSize,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
