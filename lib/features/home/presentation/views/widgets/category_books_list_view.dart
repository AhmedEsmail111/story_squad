import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/core/widgets/book_tile_item.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/presentation/manager/category_books/category_books_cubit.dart';

class CategoryBooksListView extends StatefulWidget {
  const CategoryBooksListView(
      {super.key, required this.categoryBooks, required this.category});
  final List<BookEntity> categoryBooks;
  final String category;

  @override
  State<CategoryBooksListView> createState() => _CategoryBooksListViewState();
}

class _CategoryBooksListViewState extends State<CategoryBooksListView> {
  bool _isLoading = false;
  int _nextPage = 1;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() async {
    final currentPosition = _scrollController.position.pixels;
    final maxLength = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxLength) {
      if (!_isLoading) {
        _isLoading = true;
        await context.read<CategoryBooksCubit>().fetchCategoryBooks(
              pageNumber: _nextPage++,
              category: widget.category,
            );
        _isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(
          left: AppSpaces.kSpace30,
          right: AppSpaces.kSpace30,
          bottom: AppSpaces.kSpace20,
        ),
        controller: _scrollController,
        itemBuilder: (context, index) => BookTileItem(
          bookEntity: widget.categoryBooks[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: AppSpaces.kSpace12,
        ),
        itemCount: widget.categoryBooks.length,
      ),
    );
  }
}
