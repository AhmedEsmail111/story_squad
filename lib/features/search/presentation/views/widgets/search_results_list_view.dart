import 'package:flutter/material.dart';

import '../../../../../core/utils/spaces.dart';
import '../../../../../core/widgets/book_tile_item.dart';
import '../../../../home/domain/entities/book_entity.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(
          left: AppSpaces.kSpace30,
          right: AppSpaces.kSpace30,
          bottom: AppSpaces.kSpace16),
      itemCount: books.length,
      itemBuilder: (_, index) => BookTileItem(
        bookEntity: books[index],
      ),
      separatorBuilder: (_, i) => const SizedBox(height: AppSpaces.kSpace20),
    );
  }
}
