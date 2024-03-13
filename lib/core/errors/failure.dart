import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: ' Connection timeout With Server');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: ' Send timeout With Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: ' Receive timeout With Server');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: ' Bad certificate  With Server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!);
      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: ' Connection was cancelled With Server');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: 'Oops, There was a problem. please try again later.');
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    if (response.statusCode! == 404) {
      return ServerFailure(
          errorMessage: 'Your request was not found, please try again later.');
    } else if (response.statusCode! >= 500) {
      return ServerFailure(
          errorMessage:
              'There is a problem with the server, please try again later.');
    } else if (response.statusCode! == 400 ||
        response.statusCode! == 401 ||
        response.statusCode! == 403) {
      return ServerFailure(
        errorMessage: response.data['error']['message'],
      );
    }

    return ServerFailure(
      errorMessage: 'There was an error, please try again later.',
    );
  }
}

class HiveFailure extends Failure {
  HiveFailure({required super.errorMessage});
}
