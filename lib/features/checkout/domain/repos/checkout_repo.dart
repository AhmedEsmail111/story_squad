import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:story_squad/core/errors/failure.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';

import '../../data/models/amount_model.dart';
import '../../data/models/items_list_model.dart';
import '../../data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> addToCart({required OrderEntity orderEntity});
  Future<Either<Failure, void>> removeFromCart(
      {required OrderEntity orderEntity});
  Either<Failure, List<OrderEntity>> getCart();
  Future<Either<Failure, void>> removeCart();
  Future<Either<Failure, void>> changeQuantity(
      {required int quantity, required String orderId});

  Future<Either<Failure, void>> makeStripePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});

  Either<Failure, Widget> makePaypalPayment({
    required Map<String, dynamic> transactionData,
    required BuildContext context,
    required AmountModel amount,
    required ItemsListModel items,
    required void Function() onSuccess,
  });
}
