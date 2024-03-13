import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_squad/features/home/presentation/views/widgets/cart_items_length_container.dart';

import '../../../../../core/utils/spaces.dart';
import '../../../../checkout/presentation/manager/checkout/checkout_cubit.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar(
      {super.key, required this.onPressed, required this.id});
  final void Function()? onPressed;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpaces.kSpace30,
        right: AppSpaces.kSpace30,
        top: AppSpaces.kSpace16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
          BlocBuilder<CheckoutCubit, CheckoutStates>(
            builder: (context, state) {
              final cubit = BlocProvider.of<CheckoutCubit>(context);
              return Stack(
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                        disabledForegroundColor: Colors.white.withOpacity(0.8)),
                    onPressed: onPressed,
                    icon: Icon(
                      cubit.isInCart(id)
                          ? Icons.shopping_cart_outlined
                          : Icons.add_shopping_cart,
                    ),
                  ),
                  if (cubit.inCartItems.keys.contains(id))
                    CartItemsLengthContainer(
                      text: cubit.inCartItems[id].toString(),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
