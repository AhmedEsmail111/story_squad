import 'package:bloc/bloc.dart';
import 'package:story_squad/features/home/domain/use_cases/fetch_similar_books_case.dart';

import '../similar_books/similar_books_states.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates> {
  final FetchSimilarBooksCase fetchSimilarBooksCase;
  SimilarBooksCubit({required this.fetchSimilarBooksCase})
      : super(SimilarBooksInitial());

  Future<void> fetchSimilarBooks({required String similarity}) async {
    emit(SimilarBooksLoading());
    final result = await fetchSimilarBooksCase.execute(similarity);

    result.fold(
      (failure) => emit(
        SimilarBooksFailure(errorMessage: failure.errorMessage),
      ),
      (books) => emit(
        SimilarBooksSuccess(books: books),
      ),
    );
  }
}
