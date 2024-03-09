import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_squad/core/utils/router.dart';

import '../../../../../core/utils/spaces.dart';
import '../../../domain/entities/book_entity.dart';
import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kSpace30),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context).pushReplacement(
              AppRouter.kBookDetailsView,
              extra: books[index],
            );
          },
          child: CustomBookImage(
            image: books[index].image,
            borderRadius: AppSpaces.kBorderRadius8,
          ),
        ),
        separatorBuilder: (_, i) => const SizedBox(width: 10),
      ),
    );
  }
}
