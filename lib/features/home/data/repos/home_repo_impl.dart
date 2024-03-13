import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/features/home/data/data_sources/local_data_source.dart';
import 'package:story_squad/features/home/data/data_sources/remote_data_source.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/domain/repos/home_repo.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeRepoImpl extends HomeRepo {
  final RemoteHomeDataSource remoteHomeDataSource;
  final LocalHomeDataSource localHomeDataSource;

  HomeRepoImpl(
      {required this.remoteHomeDataSource, required this.localHomeDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = localHomeDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        print('this is the last  newest element in hive   ${books.last.title}');
        return right(books);
      }

      books =
          await remoteHomeDataSource.fetchNewestBooks(pageNumber: pageNumber);
      print('this is the last newest element in api   ${books.last.title}');

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

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = localHomeDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        print('this is the last element in hive   ${books.last.title}');
        return right(books);
      }

      books =
          await remoteHomeDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      print('this is the last element in api   ${books.last.title}');
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

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String similarity}) async {
    try {
      List<BookEntity> books =
          await remoteHomeDataSource.fetchSimilarBooks(similarity: similarity);
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

  @override
  Future<Either<Failure, void>> launchPreview({required String url}) async {
    try {
      final uri = Uri.parse(url);
      final result = await launchUrl(uri);

      if (result) {
        return right(null);
      } else {
        return left(
          ServerFailure(errorMessage: ' Something went wrong'),
        );
      }
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchCategoryBooks(
      {int pageNumber = 0, required String category}) async {
    try {
      List<BookEntity> books = await remoteHomeDataSource.fetchCategoryBooks(
          category: category, pageNumber: pageNumber);
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
