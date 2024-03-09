import 'package:hive/hive.dart';
import 'package:story_squad/core/utils/constants.dart';

import '/features/home/domain/entities/book_entity.dart';

abstract class LocalHomeDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber});

  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class LocalHomeDataSourceImpl extends LocalHomeDataSource {
  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    final startIndex = pageNumber * 10;
    final endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>(AppConstants.kNewestBox);

    final boxLength = box.values.length;
    if (startIndex >= boxLength || endIndex > boxLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    final startIndex = pageNumber * 10;
    final endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(AppConstants.kFeaturedBox);
    final boxLength = box.values.length;
    if (startIndex >= boxLength || endIndex > boxLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
