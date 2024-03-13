part of 'checkout_cubit.dart';

abstract class CheckoutStates {}

class CheckoutInitial extends CheckoutStates {}

class AddToCartLoading extends CheckoutStates {}

class AddToCartSuccess extends CheckoutStates {}

class AddToCartFailure extends CheckoutStates {
  final String errorMessage;

  AddToCartFailure({required this.errorMessage});
}

class RemoveFromCartLoading extends CheckoutStates {}

class RemoveFromCartSuccess extends CheckoutStates {}

class RemoveFromCartFailure extends CheckoutStates {
  final String errorMessage;

  RemoveFromCartFailure({required this.errorMessage});
}

class GetCartLoading extends CheckoutStates {}

class GetCartSuccess extends CheckoutStates {
  final List<OrderEntity> cart;

  GetCartSuccess({required this.cart});
}

class GetCartFailure extends CheckoutStates {
  final String errorMessage;

  GetCartFailure({required this.errorMessage});
}

class RemoveCartLoading extends CheckoutStates {}

class RemoveCartSuccess extends CheckoutStates {}

class RemoveCartFailure extends CheckoutStates {
  final String errorMessage;

  RemoveCartFailure({required this.errorMessage});
}

class ChangeQuantityLoading extends CheckoutStates {}

class ChangeQuantitySuccess extends CheckoutStates {}

class ChangeQuantityFailure extends CheckoutStates {
  final String errorMessage;

  ChangeQuantityFailure({required this.errorMessage});
}
