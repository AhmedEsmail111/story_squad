import 'package:flutter/material.dart';
import 'package:story_squad/core/widgets/custom_fading_widget.dart';
import 'package:story_squad/features/home/presentation/views/widgets/custom_fading_book_tile_item.dart';

import '../../../../../core/utils/spaces.dart';

class CustomFadingRecentlyAddedList extends StatelessWidget {
  const CustomFadingRecentlyAddedList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.only(
            left: AppSpaces.kSpace30,
            right: AppSpaces.kSpace30,
            bottom: AppSpaces.kSpace20),
        itemCount: 5,
        itemBuilder: (_, index) => const CustomFadingBookTileItem(),
        separatorBuilder: (_, i) => const SizedBox(height: AppSpaces.kSpace20),
      ),
    );
  }
}
