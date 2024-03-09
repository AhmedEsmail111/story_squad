import 'package:bloc/bloc.dart';

import '../../../../home/domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_filtered_books_case.dart';

part 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  final FetchFilteredBooksCase fetchFilteredBooksCase;
  SearchCubit({required this.fetchFilteredBooksCase}) : super(SearchInitial());

  String query = '';
  void changeQueryText(String newValue) {
    query = newValue;
    emit(ChangeQueryTextState());
  }

  Future<void> fetchFilteredBooks(
      {int pageNumber = 0, required String query}) async {
    if (pageNumber == 0) {
      emit(SearchLoading());
    } else {
      emit(SearchPaginationLoading());
    }
    final result = await fetchFilteredBooksCase.execute(pageNumber, query);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(
            SearchFailure(errorMessage: failure.errorMessage),
          );
        } else {
          emit(
            SearchPaginationFailure(errorMessage: failure.errorMessage),
          );
        }
      },
      (books) => emit(
        SearchSuccess(books: books),
      ),
    );
  }
}
