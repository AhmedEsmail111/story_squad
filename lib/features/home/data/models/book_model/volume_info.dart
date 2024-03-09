import 'dimensions.dart';
import 'image_links.dart';
import 'industry_identifier.dart';

class VolumeInfo {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifier>? industryIdentifiers;
  int? pageCount;
  Dimensions? dimensions;
  String? printType;
  String? mainCategory;
  List<String>? categories;
  double? averageRating;
  int? ratingsCount;
  String? contentVersion;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.pageCount,
    this.dimensions,
    this.printType,
    this.mainCategory,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.infoLink,
    this.canonicalVolumeLink,
    this.previewLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] as String?,
        authors: (json['authors'] as List<dynamic>?)
            ?.map((author) => author.toString())
            .toList(),
        publisher: json['publisher'] as String?,
        publishedDate: json['publishedDate'] as String?,
        description: json['description'] as String?,
        industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
            ?.map((e) => IndustryIdentifier.fromJson(e as Map<String, dynamic>))
            .toList(),
        pageCount: json['pageCount'] as int?,
        dimensions: json['dimensions'] == null
            ? null
            : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
        printType: json['printType'] as String?,
        mainCategory: json['mainCategory'] as String?,
        categories: (json['categories'] as List<dynamic>?)
            ?.map((category) => category.toString())
            .toList(),
        averageRating: (json['averageRating'] as num?)?.toDouble(),
        ratingsCount: json['ratingsCount'] as int?,
        contentVersion: json['contentVersion'] as String?,
        imageLinks: json['imageLinks'] == null
            ? null
            : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
        language: json['language'] as String?,
        previewLink:
            json['previewLink'] == null ? null : json['previewLink'] as String?,
        infoLink: json['infoLink'] as String?,
        canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'authors': authors,
        'publisher': publisher,
        'publishedDate': publishedDate,
        'description': description,
        'industryIdentifiers':
            industryIdentifiers?.map((e) => e.toJson()).toList(),
        'pageCount': pageCount,
        'dimensions': dimensions?.toJson(),
        'printType': printType,
        'mainCategory': mainCategory,
        'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'contentVersion': contentVersion,
        'imageLinks': imageLinks?.toJson(),
        'language': language,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
      };
}
