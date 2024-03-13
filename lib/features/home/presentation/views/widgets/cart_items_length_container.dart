import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/spaces.dart';

class CartItemsLengthContainer extends StatelessWidget {
  const CartItemsLengthContainer({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kSpace6),
      decoration: BoxDecoration(
          color: AppConstants.kSecondaryColor,
          borderRadius: BorderRadius.circular(AppSpaces.kBorderRadius15)),
      child: Text(
        text,
      ),
    );
  }
}
