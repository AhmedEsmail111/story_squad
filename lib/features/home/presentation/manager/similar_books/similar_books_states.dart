import 'package:story_squad/features/home/domain/entities/book_entity.dart';

abstract class SimilarBooksStates {}

class SimilarBooksInitial extends SimilarBooksStates {}

class SimilarBooksLoading extends SimilarBooksStates {}

class SimilarBooksSuccess extends SimilarBooksStates {
  final List<BookEntity> books;

  SimilarBooksSuccess({required this.books});
}

class SimilarBooksFailure extends SimilarBooksStates {
  final String errorMessage;

  SimilarBooksFailure({required this.errorMessage});
}
