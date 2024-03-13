import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/presentation/views/widgets/custom_fading_book_tile_items_list.dart';
import 'package:story_squad/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:story_squad/features/search/presentation/views/widgets/search_results_list_view.dart';

class SearchResultsListViewBlocConsumer extends StatefulWidget {
  const SearchResultsListViewBlocConsumer({super.key});

  @override
  State<SearchResultsListViewBlocConsumer> createState() =>
      _SearchResultsListViewBlocConsumerState();
}

class _SearchResultsListViewBlocConsumerState
    extends State<SearchResultsListViewBlocConsumer> {
  final List<BookEntity> _books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          _books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is SearchSuccess ||
            state is SearchPaginationLoading ||
            state is SearchPaginationFailure ||
            state is ChangeQueryTextState) {
          return SearchResultsListView(
            books: _books,
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(
              state.errorMessage,
            ),
          );
        } else if (state is SearchLoading) {
          return const CustomFadingBookTileItemsList();
        } else {
          return Container();
        }
      },
    );
  }
}
