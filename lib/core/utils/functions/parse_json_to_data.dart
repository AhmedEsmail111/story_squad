import '../../../features/home/data/models/book_model/book_model.dart';
import '../../../features/home/domain/entities/book_entity.dart';

List<BookEntity> parseJsonToData(Map<String, dynamic> data) {
  final Set<BookEntity> booksSet = {};

  if (data['items'] != null) {
    for (var bookVolume in data['items']) {
      booksSet.add(
        BookModel.fromJson(bookVolume),
      );
    }
  }

  return booksSet.toList();
}
