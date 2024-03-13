import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/core/utils/assets.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/core/utils/styles.dart';
import 'package:story_squad/features/checkout/presentation/manager/checkout/checkout_cubit.dart';

import 'payment_method_item.dart';

class PaymentMethodsRow extends StatelessWidget {
  const PaymentMethodsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutStates>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();
        return Column(
          children: [
            Text(
              'Payment Methods',
              style:
                  AppStyles.textStyle18.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: AppSpaces.kSpace16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PaymentMethodItem(
                  image: AppAssets.kCardImage,
                  isActive: cubit.chosenPaymentMethod == PaymentMethods.card,
                  onTap: () {
                    cubit.changePaymentMethodIndex(
                      paymentMethod: PaymentMethods.card,
                    );
                  },
                ),
                const SizedBox(
                  width: 24,
                ),
                PaymentMethodItem(
                  image: AppAssets.kPaypalImage,
                  isActive: cubit.chosenPaymentMethod == PaymentMethods.paypal,
                  onTap: () {
                    cubit.changePaymentMethodIndex(
                      paymentMethod: PaymentMethods.paypal,
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
