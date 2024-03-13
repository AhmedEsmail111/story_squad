import '../../../domain/entities/book_entity.dart';

abstract class CategoryBooksStates {}

class CategoryBooksInitial extends CategoryBooksStates {}

class CategoryBooksLoading extends CategoryBooksStates {}

class CategoryBooksPaginationLoading extends CategoryBooksStates {}

class CategoryBooksFailure extends CategoryBooksStates {
  final String errorMessage;

  CategoryBooksFailure({required this.errorMessage});
}

class CategoryBooksPaginationFailure extends CategoryBooksStates {
  final String errorMessage;

  CategoryBooksPaginationFailure({required this.errorMessage});
}

class CategoryBooksSuccess extends CategoryBooksStates {
  final List<BookEntity> books;

  CategoryBooksSuccess({required this.books});
}
