import 'package:bloc/bloc.dart';
import 'package:story_squad/features/home/domain/use_cases/fetch_newest_books_case.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  final FetchNewestBooksCase fetchNewestBooksCase;
  NewestBooksCubit({required this.fetchNewestBooksCase})
      : super(NewestBooksInitial());

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    final result = await fetchNewestBooksCase.execute(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(
            NewestBooksFailure(errorMessage: failure.errorMessage),
          );
        } else {
          emit(
            NewestBooksPaginationFailure(errorMessage: failure.errorMessage),
          );
        }
      },
      (books) => emit(
        NewestBooksSuccess(books: books),
      ),
    );
  }
}
