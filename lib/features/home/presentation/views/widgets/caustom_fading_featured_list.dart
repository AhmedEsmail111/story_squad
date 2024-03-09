import 'package:flutter/material.dart';
import 'package:story_squad/core/widgets/custom_fading_widget.dart';
import 'package:story_squad/features/home/presentation/views/widgets/custom_fading_book_image.dart';

import '../../../../../core/utils/spaces.dart';

class CustomFadingFeaturedList extends StatelessWidget {
  const CustomFadingFeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.28,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kSpace24),
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) => const CustomFadingBookImage(),
          separatorBuilder: (_, i) => const SizedBox(width: 12),
        ),
      ),
    );
  }
}
