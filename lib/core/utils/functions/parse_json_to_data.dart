import '../../../features/home/data/models/book_model/book_model.dart';
import '../../../features/home/domain/entities/book_entity.dart';

List<BookEntity> parseJsonToData(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  if (data['items'] != null) {
    for (var bookVolume in data['items']) {
      books.add(
        BookModel.fromJson(bookVolume),
      );
    }
  }

  return books;
}
