import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:story_squad/features/home/presentation/manager/similar_books/similar_books_states.dart';
import 'package:story_squad/features/home/presentation/views/widgets/custom_fading_similar_books_list.dart';
import 'package:story_squad/features/home/presentation/views/widgets/silmilar_books_list_view.dart';

class SimilarBooksListBlocConsumer extends StatelessWidget {
  const SimilarBooksListBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SimilarBooksListView(
            books: state.books,
          );
        }
        if (state is SimilarBooksFailure) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: Text(state.errorMessage),
          ));
        } else if (state is SimilarBooksLoading) {
          return const CustomFadingSimilarBooksList();
        } else {
          return const Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: Text('No Similar Books found!'),
          ));
        }
      },
    );
  }
}
