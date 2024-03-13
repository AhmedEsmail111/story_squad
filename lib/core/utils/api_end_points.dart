abstract class EndPoints {
  static const baseUrl = 'https://www.googleapis.combooks/v1';
  static const kFeaturedBooks = '$baseUrl/volumes?Filtering=full&q=around the';
  static const kNewestBooks =
      '$baseUrl/volumes?Filtering=full&q=all of the&orderBy=newest';

  static String kSearchEndPoint(
          {required String query, required int pageNumber}) =>
      '$baseUrl/volumes?Filtering=full&q=$query&startIndex=${(pageNumber * 10)}';

  static const kSimilarBooks = '$baseUrl/volumes?Filtering=full&q=';
  static String kCategoryEndPoint(
          {required String category, required int pageNumber}) =>
      '$baseUrl/volumes?Filtering=full&q=$category+intitle&startIndex=${(pageNumber * 10)}';

  static const kCreatePaymentIntent =
      'https://api.stripe.com/v1/payment_intents';

  static const kCreateEphemeralKey = 'https://api.stripe.com/v1/ephemeral_keys';
}
