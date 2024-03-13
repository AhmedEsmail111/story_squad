import 'package:flutter/material.dart';
import 'package:story_squad/features/home/presentation/views/widgets/category_item.dart';

import '../../../../../core/utils/spaces.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = <String>[
      'Programming',
      'Marketing',
      'Finance',
      'Medicine',
      'Sport',
    ];
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.07,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kSpace24),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            CategoryItem(category: categories[index]),
        separatorBuilder: (_, i) => const SizedBox(width: 12),
      ),
    );
  }
}
