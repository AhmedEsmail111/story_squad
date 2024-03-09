part of 'newest_books_cubit.dart';

abstract class NewestBooksStates {}

class NewestBooksInitial extends NewestBooksStates {}

class NewestBooksLoading extends NewestBooksStates {}

class NewestBooksPaginationLoading extends NewestBooksStates {}

class NewestBooksFailure extends NewestBooksStates {
  final String errorMessage;

  NewestBooksFailure({required this.errorMessage});
}

class NewestBooksPaginationFailure extends NewestBooksStates {
  final String errorMessage;

  NewestBooksPaginationFailure({required this.errorMessage});
}

class NewestBooksSuccess extends NewestBooksStates {
  final List<BookEntity> books;

  NewestBooksSuccess({required this.books});
}
