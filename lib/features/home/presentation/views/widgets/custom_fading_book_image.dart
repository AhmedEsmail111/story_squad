import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/spaces.dart';

class CustomFadingBookImage extends StatelessWidget {
  final double? borderRadius;

  const CustomFadingBookImage({super.key, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSpaces.kBorderRadius15,
        ),
        child: Container(
          color: AppConstants.kFadingColor,
        ),
      ),
    );
  }
}
