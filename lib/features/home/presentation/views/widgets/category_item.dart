import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_squad/core/utils/constants.dart';
import 'package:story_squad/core/utils/router.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kCategoryView,
          extra: category,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpaces.kSpace16, vertical: AppSpaces.kSpace5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpaces.kBorderRadius24),
          color: AppConstants.kSecondaryColor,
        ),
        child: Center(
          child: Text(
            category,
            style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
