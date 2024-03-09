part of 'featured_books_cubit.dart';

abstract class FeaturedBooksStates {}

class FeaturedBooksInitial extends FeaturedBooksStates {}

class FeaturedBooksLoading extends FeaturedBooksStates {}

class FeaturedBooksPaginationLoading extends FeaturedBooksStates {}

class FeaturedBooksFailure extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedBooksFailure({required this.errorMessage});
}

class FeaturedBooksPaginationFailure extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedBooksPaginationFailure({required this.errorMessage});
}

class FeaturedBooksSuccess extends FeaturedBooksStates {
  final List<BookEntity> books;

  FeaturedBooksSuccess({required this.books});
}
