import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/core/utils/functions/build_error_snack_bar.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:story_squad/features/home/presentation/views/widgets/custom_fading_book_tile_items_list.dart';
import 'package:story_squad/features/home/presentation/views/widgets/recently_added_list_view.dart';

class RecentlyAddedListViewBlocConsumer extends StatefulWidget {
  const RecentlyAddedListViewBlocConsumer({super.key});

  @override
  State<RecentlyAddedListViewBlocConsumer> createState() =>
      _RecentlyAddedListViewBlocConsumerState();
}

class _RecentlyAddedListViewBlocConsumerState
    extends State<RecentlyAddedListViewBlocConsumer> {
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksStates>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewestBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          return RecentlyAddedListView(
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const CustomFadingBookTileItemsList();
        }
      },
    );
  }
}
