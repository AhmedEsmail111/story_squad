import 'package:flutter/material.dart';

import '../../../../../core/utils/spaces.dart';
import '../../../../../core/widgets/custom_fading_widget.dart';
import 'custom_fading_book_tile_item.dart';

class CustomFadingCategoryBooksListView extends StatelessWidget {
  const CustomFadingCategoryBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomFadingWidget(
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            left: AppSpaces.kSpace30,
            right: AppSpaces.kSpace30,
            bottom: AppSpaces.kSpace20,
          ),
          itemCount: 5,
          itemBuilder: (_, index) => const CustomFadingBookTileItem(),
          separatorBuilder: (_, i) =>
              const SizedBox(height: AppSpaces.kSpace20),
        ),
      ),
    );
  }
}
