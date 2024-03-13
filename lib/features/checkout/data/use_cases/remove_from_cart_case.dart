import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repos/checkout_repo.dart';

class RemoveFromCartCase extends UseCase<void, OrderEntity> {
  final CheckoutRepo checkoutRepo;

  RemoveFromCartCase({required this.checkoutRepo});
  @override
  Future<Either<Failure, void>> execute([OrderEntity? param]) async {
    return await checkoutRepo.removeFromCart(orderEntity: param!);
  }
}
