import 'package:bloc/bloc.dart';
import 'package:story_squad/features/home/domain/use_cases/fetch_category_books_case.dart';

import 'category_books_state.dart';

class CategoryBooksCubit extends Cubit<CategoryBooksStates> {
  final FetchCategoryBooksCase fetchCategoryBooksCase;
  CategoryBooksCubit({required this.fetchCategoryBooksCase})
      : super(CategoryBooksInitial());

  Future<void> fetchCategoryBooks(
      {int pageNumber = 0, required String category}) async {
    if (pageNumber == 0) {
      emit(CategoryBooksLoading());
    } else {
      emit(CategoryBooksPaginationLoading());
    }
    final result = await fetchCategoryBooksCase.execute(pageNumber, category);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(
            CategoryBooksFailure(errorMessage: failure.errorMessage),
          );
        } else {
          emit(
            CategoryBooksPaginationFailure(errorMessage: failure.errorMessage),
          );
        }
      },
      (books) => emit(
        CategoryBooksSuccess(books: books),
      ),
    );
  }
}
