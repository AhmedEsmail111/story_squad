import 'package:dartz/dartz.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/core/use_case/use_case.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/search/domain/repos/search_repo.dart';

class FetchFilteredBooksCase extends UseCase<List<BookEntity>, int> {
  final SearchRepo searchRepo;

  FetchFilteredBooksCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> execute(
      [int param = 0, String query = '']) async {
    return await searchRepo.fetchFilteredBooks(query: query, pageNumber: param);
  }
}
