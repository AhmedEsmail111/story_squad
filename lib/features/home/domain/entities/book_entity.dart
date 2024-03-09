import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String authorName;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final double rating;
  @HiveField(6)
  final String previewUrl;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.previewUrl,
  });
}
