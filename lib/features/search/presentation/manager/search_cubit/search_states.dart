part of 'search_cubit.dart';

abstract class SearchStates {}

class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}

class SearchSuccess extends SearchStates {
  final List<BookEntity> books;

  SearchSuccess({required this.books});
}

class SearchPaginationLoading extends SearchStates {}

class SearchFailure extends SearchStates {
  final String errorMessage;

  SearchFailure({required this.errorMessage});
}

class SearchPaginationFailure extends SearchStates {
  final String errorMessage;

  SearchPaginationFailure({required this.errorMessage});
}

class ChangeQueryTextState extends SearchStates {}
