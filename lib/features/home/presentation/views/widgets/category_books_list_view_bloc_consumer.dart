import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/presentation/manager/category_books/category_books_cubit.dart';
import 'package:story_squad/features/home/presentation/manager/category_books/category_books_state.dart';
import 'package:story_squad/features/home/presentation/views/widgets/category_books_list_view.dart';
import 'package:story_squad/features/home/presentation/views/widgets/custom_fading_category_books_list.dart';

import '../../../../../core/utils/functions/build_error_snack_bar.dart';

class CategoryBooksListViewBlocConsumer extends StatefulWidget {
  const CategoryBooksListViewBlocConsumer({super.key, required this.category});
  final String category;

  @override
  State<CategoryBooksListViewBlocConsumer> createState() =>
      _CategoryBooksListViewBlocConsumerState();
}

class _CategoryBooksListViewBlocConsumerState
    extends State<CategoryBooksListViewBlocConsumer> {
  final List<BookEntity> categoryBooks = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBooksCubit, CategoryBooksStates>(
      listener: (context, state) {
        if (state is CategoryBooksSuccess) {
          categoryBooks.addAll(state.books);
        }
        if (state is CategoryBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is CategoryBooksSuccess ||
            state is CategoryBooksPaginationLoading ||
            state is CategoryBooksPaginationFailure) {
          return CategoryBooksListView(
            categoryBooks: categoryBooks,
            category: widget.category,
          );
        } else if (state is CategoryBooksFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const CustomFadingCategoryBooksListView();
        }
      },
    );
  }
}
