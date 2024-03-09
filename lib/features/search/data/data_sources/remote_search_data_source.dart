import 'package:story_squad/core/utils/api_end_points.dart';
import 'package:story_squad/core/utils/api_service.dart';
import 'package:story_squad/core/utils/functions/parse_json_to_data.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';

abstract class RemoteSearchDataSource {
  RemoteSearchDataSource();
  Future<List<BookEntity>> fetchFilteredBooks(
      {int pageNumber = 0, required String query});
}

class RemoteSearchDataSourceImpl extends RemoteSearchDataSource {
  final ApiService apiService;

  RemoteSearchDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFilteredBooks(
      {int pageNumber = 0, required String query}) async {
    final data = await apiService.get(
      endPoint: EndPoints.kSearchEndPoint(query: query, pageNumber: pageNumber),
    );

    final books = parseJsonToData(data);
    print('this the last element in search results ${books.last.title}');
    return books;
  }
}
