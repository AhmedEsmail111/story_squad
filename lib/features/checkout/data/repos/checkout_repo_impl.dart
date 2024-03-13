import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/features/checkout/data/data_sources/checkout_local_data_source.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';

import '../../domain/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final CheckoutLocalDataSource checkoutLocalDataSource;

  CheckoutRepoImpl({required this.checkoutLocalDataSource});
  @override
  Future<Either<Failure, void>> addToCart(
      {required OrderEntity orderEntity}) async {
    try {
      await checkoutLocalDataSource.addToCart(orderEntity: orderEntity);

      return right(null);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure(
            errorMessage: e.toString(),
          ),
        );
      }
      return left(
        HiveFailure(errorMessage: 'Something went wrong!,try again later'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> changeQuantity(
      {required int quantity, required String orderId}) async {
    try {
      await checkoutLocalDataSource.changeQuantity(
          quantity: quantity, orderId: orderId);

      return right(null);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure(
            errorMessage: e.toString(),
          ),
        );
      }
      return left(
        HiveFailure(errorMessage: 'Something went wrong!,try again later'),
      );
    }
  }

  @override
  Either<Failure, List<OrderEntity>> getCart() {
    try {
      final List<OrderEntity> cart = checkoutLocalDataSource.getCart();

      return right(cart);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure(
            errorMessage: e.toString(),
          ),
        );
      }
      return left(
        HiveFailure(errorMessage: 'Something went wrong!,try again later'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeCart() async {
    try {
      await checkoutLocalDataSource.removeCart();

      return right(null);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure(
            errorMessage: e.toString(),
          ),
        );
      }
      return left(
        HiveFailure(errorMessage: 'Something went wrong!,try again later'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(
      {required OrderEntity orderEntity}) async {
    try {
      await checkoutLocalDataSource.removeFromCart(orderEntity: orderEntity);

      return right(null);
    } catch (e) {
      if (e is HiveError) {
        return left(
          HiveFailure(
            errorMessage: e.toString(),
          ),
        );
      }
      return left(
        HiveFailure(errorMessage: 'Something went wrong!,try again later'),
      );
    }
  }
}
