import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:story_squad/features/checkout/presentation/views/widgets/cart_list_view.dart';

class CartListViewBlocBuilder extends StatelessWidget {
  const CartListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutStates>(
      builder: (context, state) {
        return CartListView(
          cart: context.read<CheckoutCubit>().cartItems,
        );
      },
    );
  }
}
