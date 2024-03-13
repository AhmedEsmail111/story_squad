import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/spaces.dart';
import '../../manager/checkout/checkout_cubit.dart';
import 'cart_details.dart';
import 'cart_list_view_bloc_builder.dart';
import 'payment_methods_row.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutStates>(
      listener: (context, state) {
        if (state is GetCartSuccess && state.cart.isEmpty) {
          print('it is working');
        }
      },
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();

        return cubit.cartItems.isNotEmpty
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpaces.kSpace30),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: AppSpaces.kSpace16,
                      ),
                      const CartListViewBlocBuilder(),
                      const SizedBox(
                        height: AppSpaces.kSpace40,
                      ),
                      CartDetails(
                        subtotal: cubit.getTotal(cubit.cartItems),
                      ),
                      const SizedBox(
                        height: AppSpaces.kSpace24,
                      ),
                      const PaymentMethodsRow(),
                      const SizedBox(
                        height: AppSpaces.kSpace24,
                      ),
                    ],
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
