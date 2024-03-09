import 'package:flutter/material.dart';
import 'package:story_squad/core/utils/constants.dart';
import 'package:story_squad/core/widgets/custom_fading_widget.dart';

import '../../../../../core/utils/spaces.dart';

class CustomFadingSimilarBooksList extends StatelessWidget {
  const CustomFadingSimilarBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.15,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kSpace30),
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) => AspectRatio(
            aspectRatio: 2.6 / 4,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSpaces.kBorderRadius8),
                child: Container(
                  color: AppConstants.kFadingColor,
                )),
          ),
          separatorBuilder: (_, i) => const SizedBox(width: 10),
        ),
      ),
    );
  }
}
