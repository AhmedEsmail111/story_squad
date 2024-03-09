import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../home/domain/entities/book_entity.dart';
import '../../data/data_sources/remote_search_data_source.dart';
import '../../domain/repos/search_repo.dart';
import '/core/errors/failure.dart';

class SearchRepoImpl extends SearchRepo {
  final RemoteSearchDataSource remoteSearchDataSource;

  SearchRepoImpl({required this.remoteSearchDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFilteredBooks(
      {required String query, int pageNumber = 0}) async {
    try {
      List<BookEntity> books = await remoteSearchDataSource.fetchFilteredBooks(
          query: query, pageNumber: pageNumber);

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
