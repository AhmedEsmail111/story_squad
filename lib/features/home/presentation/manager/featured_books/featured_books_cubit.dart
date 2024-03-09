import 'package:bloc/bloc.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/domain/use_cases/fetch_featured_books_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  final FetchFeaturedBooksCase fetchFeaturedBooksCase;
  FeaturedBooksCubit({required this.fetchFeaturedBooksCase})
      : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    final result = await fetchFeaturedBooksCase.execute(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(
            FeaturedBooksFailure(errorMessage: failure.errorMessage),
          );
        } else {
          emit(
            FeaturedBooksPaginationFailure(errorMessage: failure.errorMessage),
          );
        }
      },
      (books) => emit(
        FeaturedBooksSuccess(books: books),
      ),
    );
  }
}
