import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:story_squad/core/utils/router.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/features/home/presentation/views/widgets/cart_items_length_container.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../checkout/presentation/manager/checkout/checkout_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpaces.kSpace30, vertical: AppSpaces.kSpace8),
      child: Row(
        children: [
          Image.asset(
            AppAssets.kLogoImage,
            height: 18,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kCheckoutView);
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 24,
                ),
              ),
              BlocBuilder<CheckoutCubit, CheckoutStates>(
                builder: (context, state) {
                  return CartItemsLengthContainer(
                    text: BlocProvider.of<CheckoutCubit>(context)
                        .cartItems
                        .length
                        .toString(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
