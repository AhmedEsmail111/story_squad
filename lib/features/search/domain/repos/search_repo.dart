import 'package:dartz/dartz.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFilteredBooks(
      {required String query, int pageNumber = 0});
}
