import 'package:bloc/bloc.dart';
import 'package:story_squad/features/checkout/data/use_cases/add_to_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/change_quantity_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/get_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/remove_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/remove_from_cart_case.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutStates> {
  final AddToCartCase addToCartCase;
  final RemoveFromCartCase removeFromCartCase;
  final GetCartCase getCartCase;
  final RemoveCartCase removeCartCase;
  final ChangeQuantityCase changeQuantityCase;

  CheckoutCubit({
    required this.addToCartCase,
    required this.removeFromCartCase,
    required this.getCartCase,
    required this.removeCartCase,
    required this.changeQuantityCase,
  }) : super(CheckoutInitial());

  Future<void> addToCart({required OrderEntity orderEntity}) async {
    emit(AddToCartLoading());
    final result = await addToCartCase.execute(orderEntity);

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
    emit(RemoveFromCartLoading());
    final result = await removeFromCartCase.execute(orderEntity);

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
      (cart) => emit(
        GetCartSuccess(cart: cart),
      ),
    );
  }

  Future<void> removeCart() async {
    emit(RemoveCartLoading());
    final result = await removeCartCase.execute();

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
    emit(ChangeQuantityLoading());
    final result = await changeQuantityCase.execute(quantity, orderId);

    result.fold(
      (e) => emit(
        ChangeQuantityFailure(errorMessage: e.errorMessage),
      ),
      (s) => emit(
        ChangeQuantitySuccess(),
      ),
    );
  }
}
