import 'package:dartz/dartz.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/core/use_case/use_case.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/domain/repos/home_repo.dart';

class FetchSimilarBooksCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> execute([String param = '']) async {
    return await homeRepo.fetchSimilarBooks(similarity: param);
  }
}
