abstract class EndPoints {
  static const kFeaturedBooks = 'volumes?Filtering=full&q=around the';
  static const kNewestBooks =
      'volumes?Filtering=full&q=all of the&orderBy=newest';

  static String kSearchEndPoint(
          {required String query, required int pageNumber}) =>
      'volumes?Filtering=full&q=$query&startIndex=${(pageNumber * 10)}';

  static const kSimilarBooks = 'volumes?Filtering=full&q=';
}
