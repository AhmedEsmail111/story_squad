import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  final String title, value;
  const TotalPrice({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle24,
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle24,
        ),
      ],
    );
  }
}
