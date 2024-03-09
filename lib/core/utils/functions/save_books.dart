import 'package:hive/hive.dart';

import '../../../features/home/domain/entities/book_entity.dart';

void saveDataToHive(
    {required List<BookEntity> books, required String boxName}) {
  var box = Hive.box<BookEntity>(boxName);

  box.addAll(books);
}
