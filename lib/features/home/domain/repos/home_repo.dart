import 'package:dartz/dartz.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String similarity});

  Future<Either<Failure, void>> launchPreview({required String url});
}
