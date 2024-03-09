import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_squad/core/utils/constants.dart';

import '../../../../../core/utils/spaces.dart';

class CustomBookImage extends StatelessWidget {
  final double? borderRadius;
  final String image;
  const CustomBookImage({super.key, this.borderRadius, required this.image});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSpaces.kBorderRadius15,
        ),
        child: CachedNetworkImage(
          errorWidget: (ctx, str, obj) => Container(
            color: AppConstants.kFadingColor,
          ),
          imageUrl: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
