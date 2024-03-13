import 'package:dartz/dartz.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> addToCart({required OrderEntity orderEntity});
  Future<Either<Failure, void>> removeFromCart(
      {required OrderEntity orderEntity});
  Either<Failure, List<OrderEntity>> getCart();
  Future<Either<Failure, void>> removeCart();
  Future<Either<Failure, void>> changeQuantity(
      {required int quantity, required String orderId});
}
