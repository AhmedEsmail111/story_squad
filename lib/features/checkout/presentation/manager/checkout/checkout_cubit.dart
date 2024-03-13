import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:story_squad/features/checkout/data/use_cases/add_to_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/change_quantity_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/get_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/remove_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/remove_from_cart_case.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';
import 'package:story_squad/features/checkout/domain/repos/checkout_repo.dart';

import '../../../data/models/amount_model.dart';
import '../../../data/models/items_list_model.dart';
import '../../../data/models/payment_intent_input_model.dart';
import '../../../data/use_cases/make_stripe_payment_case.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutStates> {
  final CheckoutRepo checkoutRepo;
  final AddToCartCase addToCartCase;
  final RemoveFromCartCase removeFromCartCase;
  final GetCartCase getCartCase;
  final RemoveCartCase removeCartCase;
  final ChangeQuantityCase changeQuantityCase;
  final MakeStripePaymentCase makeStripePaymentCase;

  CheckoutCubit({
    required this.checkoutRepo,
    required this.addToCartCase,
    required this.removeFromCartCase,
    required this.getCartCase,
    required this.removeCartCase,
    required this.changeQuantityCase,
    required this.makeStripePaymentCase,
  }) : super(CheckoutInitial());

  Map<String, int> inCartItems = {};
  List<OrderEntity> cartItems = [];

  bool isInCart(String id) => inCartItems.containsKey(id);

  Future<void> addToCart({required OrderEntity orderEntity}) async {
    // emit(AddToCartLoading());
    final result = await addToCartCase.execute(orderEntity);

    getCart();

    result.fold(
      (e) => emit(
        AddToCartFailure(errorMessage: e.errorMessage),
      ),
      (s) => emit(
        AddToCartSuccess(),
      ),
    );
  }

  Future<void> removeFromCart({required OrderEntity orderEntity}) async {
    // emit(RemoveFromCartLoading());
    final result = await removeFromCartCase.execute(orderEntity);
    getCart();
    result.fold(
      (e) => emit(
        RemoveFromCartFailure(errorMessage: e.errorMessage),
      ),
      (s) => emit(
        RemoveFromCartSuccess(),
      ),
    );
  }

  Future<void> getCart() async {
    final result = await getCartCase.execute();

    result.fold(
      (e) => emit(
        GetCartFailure(errorMessage: e.errorMessage),
      ),
      (cart) {
        inCartItems = {};
        for (final item in cart) {
          inCartItems.addAll(
            {item.bookId: item.quantity},
          );
        }
        cartItems = cart;

        emit(
          GetCartSuccess(cart: cart),
        );
      },
    );
  }

  Future<void> removeCart() async {
    // emit(RemoveCartLoading());
    final result = await removeCartCase.execute();
    getCart();
    result.fold(
      (e) => emit(
        RemoveCartFailure(errorMessage: e.errorMessage),
      ),
      (s) => emit(
        RemoveCartSuccess(),
      ),
    );
  }

  Future<void> changeQuantity({
    required int quantity,
    required String orderId,
  }) async {
    // emit(ChangeQuantityLoading());
    final result = await changeQuantityCase.execute(quantity, orderId);
    getCart();
    result.fold(
      (e) => emit(
        ChangeQuantityFailure(errorMessage: e.errorMessage),
      ),
      (s) => emit(
        ChangeQuantitySuccess(),
      ),
    );
  }

  Future<void> makeStripePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(StripePaymentLoading());
    final result = await makeStripePaymentCase.execute(paymentIntentInputModel);

    result.fold((e) {
      emit(
        StripePaymentFailure(errorMessage: e.errorMessage),
      );
    }, (s) {
      emit(
        StripePaymentSuccess(),
      );
    });
  }

  Widget makePaypalPayment(
      {required Map<String, dynamic> transactionData,
      required BuildContext context,
      required AmountModel amount,
      required ItemsListModel items,
      required void Function() onSuccess}) {
    Widget paymentWidget = const Placeholder();
    final result = checkoutRepo.makePaypalPayment(
      transactionData: transactionData,
      context: context,
      amount: amount,
      items: items,
      onSuccess: onSuccess,
    );

    result.fold((e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   buildErrorSnackBar(e.errorMessage),
      // );
      PaypalPaymentFailure(errorMessage: e.errorMessage);
    }, (widget) {
      paymentWidget = widget;
      PaypalPaymentSuccess();
    });
    return paymentWidget;
  }

  double getTotal(List<OrderEntity> items) {
    double sum = 0;
    for (final item in items) {
      sum += item.price * item.quantity;
    }

    return sum;
  }

  // manage the selected payment method
  var chosenPaymentMethod = PaymentMethods.card;

  void changePaymentMethodIndex({required PaymentMethods paymentMethod}) {
    chosenPaymentMethod = paymentMethod;
    emit(TogglePaymentMethod());
  }
}

enum PaymentMethods {
  card,
  paypal,
}
