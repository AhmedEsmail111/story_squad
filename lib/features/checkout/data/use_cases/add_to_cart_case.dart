import 'package:dartz/dartz.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/core/use_case/use_case.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';
import 'package:story_squad/features/checkout/domain/repos/checkout_repo.dart';

class AddToCartCase extends UseCase<void, OrderEntity> {
  final CheckoutRepo checkoutRepo;

  AddToCartCase({required this.checkoutRepo});
  @override
  Future<Either<Failure, void>> execute([OrderEntity? param]) async {
    return await checkoutRepo.addToCart(orderEntity: param!);
  }
}
