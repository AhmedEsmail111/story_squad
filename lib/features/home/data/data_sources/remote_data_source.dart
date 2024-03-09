import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/parse_json_to_data.dart';
import '../../../../core/utils/functions/save_books.dart';
import '/core/utils/api_end_points.dart';
import '/core/utils/api_service.dart';
import '/features/home/domain/entities/book_entity.dart';

abstract class RemoteHomeDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({required String similarity});
}

class RemoteHomeDataSourceImpl extends RemoteHomeDataSource {
  final ApiService _apiService;

  RemoteHomeDataSourceImpl(this._apiService);

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    final data = await _apiService.get(
      endPoint: '${EndPoints.kNewestBooks}&startIndex=${(pageNumber * 10)}',
    );
    List<BookEntity> books = parseJsonToData(data);
    saveDataToHive(books: books, boxName: AppConstants.kNewestBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    final data = await _apiService.get(
      endPoint: '${EndPoints.kFeaturedBooks}&startIndex=${(pageNumber * 10)}',
    );
    List<BookEntity> books = parseJsonToData(data);
    saveDataToHive(
      books: books,
      boxName: AppConstants.kFeaturedBox,
    );

    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks(
      {required String similarity}) async {
    final data = await _apiService.get(
        endPoint:
            '${EndPoints.kSimilarBooks}$similarity+intitle&maxResults=20');

    List<BookEntity> books = parseJsonToData(data);

    return books;
  }
}
