import 'package:flutter/material.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/features/home/presentation/views/widgets/category_books_list_view_bloc_consumer.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSpaces.kSpace16,
        ),
        CategoryBooksListViewBlocConsumer(
          category: category,
        ),
      ],
    );
  }
}
