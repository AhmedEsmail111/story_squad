import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repos/checkout_repo.dart';

class GetCartCase extends UseCase<List<OrderEntity>, void> {
  final CheckoutRepo checkoutRepo;

  GetCartCase({required this.checkoutRepo});
  @override
  Future<Either<Failure, List<OrderEntity>>> execute([void param]) async {
    return checkoutRepo.getCart();
  }
}
