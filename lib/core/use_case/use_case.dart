import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> execute([P param]);
}

// class NoParam {}
