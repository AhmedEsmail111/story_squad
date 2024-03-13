import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isThankYou;
  const OrderInfoItem(
      {super.key,
      required this.title,
      required this.value,
      this.isThankYou = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: isThankYou
              ? AppStyles.textStyle18.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                )
              : AppStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: isThankYou
              ? AppStyles.textStyle18.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                )
              : AppStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.w800,
                ),
        ),
      ],
    );
  }
}
