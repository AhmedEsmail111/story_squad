import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:story_squad/core/utils/router.dart';

import '../../features/checkout/data/models/amount_model.dart';
import '../../features/checkout/data/models/items_list_model.dart';
import 'api_keys.dart';

class PaypalService {
  Widget makePaypalPayment({
    required Map<String, dynamic> transactionData,
    required BuildContext context,
    required AmountModel amount,
    required ItemsListModel items,
    required void Function() onSuccess,
  }) {
    return PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKeys.paypalClientId,
      secretKey: ApiKeys.paypalSecretKey,
      transactions: [
        {
          "amount": amount.toJson(),
          "description": "The payment transaction description.",
          "item_list": items.toJson(),
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        onSuccess();

        GoRouter.of(context).pushReplacement(
          AppRouter.kThankYouView,
          extra: transactionData,
        );
      },
      onError: (error) {
        log("onError: $error");
        Navigator.pop(context);
      },
      onCancel: () {
        log('cancelled:');
        Navigator.pop(context);
      },
    );
  }

  // static ({AmountModel amount, ItemsListModel items}) getTransactions() {
  //   final amountModel = AmountModel(
  //     total: '100',
  //     currency: 'USD',
  //     details: Details(
  //       subtotal: '100',
  //       shipping: '0',
  //       shippingDiscount: 0,
  //     ),
  //   );

  //   final orders = [
  //     Order(
  //       name: 'Apple',
  //       quantity: 4,
  //       price: '10',
  //       currency: 'USD',
  //     ),
  //     Order(
  //       name: 'Apple',
  //       quantity: 5,
  //       price: '12',
  //       currency: 'USD',
  //     ),
  //   ];
  //   final itemsListModel = ItemsListModel(orders: orders);

  //   return (amount: amountModel, items: itemsListModel);
  // }
}
