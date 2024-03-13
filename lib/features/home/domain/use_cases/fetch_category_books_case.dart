import 'package:dartz/dartz.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/core/use_case/use_case.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/domain/repos/home_repo.dart';

class FetchCategoryBooksCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchCategoryBooksCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> execute(
      [int param = 0, String? category]) async {
    // (suppose to happen) do something like request a permission if true of false handle the case

    return await homeRepo.fetchCategoryBooks(
      pageNumber: param,
      category: category!,
    );
  }
}
