import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive/hive.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/core/utils/paypal_service.dart';
import 'package:story_squad/features/checkout/data/data_sources/checkout_local_data_source.dart';
import 'package:story_squad/features/checkout/data/models/amount_model.dart';
import 'package:story_squad/features/checkout/data/models/items_list_model.dart';
import 'package:story_squad/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';

import '../../../../core/utils/stripe_service.dart';
import '../../domain/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final PaypalService paypalService;
  final StripeService stripeService;
  final CheckoutLocalDataSource checkoutLocalDataSource;

  CheckoutRepoImpl({
    required this.paypalService,
    required this.checkoutLocalDataSource,
    required this.stripeService,
  });
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

      getCart();

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

  @override
  Future<Either<Failure, void>> makeStripePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      if (e is StripeException || e is StripeError) {
        return left(
          ServerFailure(errorMessage: '$e'),
        );
      }
      return left(
        ServerFailure(
            errorMessage: 'Something went wrong, please try again later'),
      );
    }
  }

  @override
  Either<Failure, Widget> makePaypalPayment(
      {required Map<String, dynamic> transactionData,
      required BuildContext context,
      required AmountModel amount,
      required ItemsListModel items,
      required void Function() onSuccess}) {
    try {
      final paypalCheckOutView = paypalService.makePaypalPayment(
        transactionData: transactionData,
        context: context,
        amount: amount,
        items: items,
        onSuccess: onSuccess,
      );

      return right(paypalCheckOutView);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
