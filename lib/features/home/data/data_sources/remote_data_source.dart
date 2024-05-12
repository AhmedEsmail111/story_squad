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
  Future<List<BookEntity>> fetchCategoryBooks(
      {int pageNumber = 0, required String category});
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
    print('request is done properly and data is $books');
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

    print('the result is $books');
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks(
      {required String similarity}) async {
    final data = await _apiService.get(
        endPoint: '${EndPoints.kSimilarBooks}$similarity+intitle');

    List<BookEntity> books = parseJsonToData(data);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchCategoryBooks(
      {int pageNumber = 0, required String category}) async {
    final data = await _apiService.get(
      endPoint: EndPoints.kCategoryEndPoint(
          category: category, pageNumber: pageNumber),
    );

    List<BookEntity> books = parseJsonToData(data);

    return books;
  }
}
