import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_squad/core/utils/constants.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/core/widgets/custom_button.dart';
import 'package:story_squad/features/checkout/data/models/amount_model.dart';
import 'package:story_squad/features/checkout/data/models/items_list_model.dart';
import 'package:story_squad/features/checkout/presentation/manager/checkout/checkout_cubit.dart';

import '../../../../core/utils/api_keys.dart';
import '../../../../core/utils/router.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/payment_intent_input_model.dart';
import 'widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'My Cart',
          style: AppStyles.textStyle18.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const BackButton(),
      ),
      body: const MyCartViewBody(),
      bottomNavigationBar: BlocBuilder<CheckoutCubit, CheckoutStates>(
        builder: (context, state) {
          final cubit = context.read<CheckoutCubit>();
          return cubit.cartItems.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                      left: AppSpaces.kSpace24,
                      right: AppSpaces.kSpace24,
                      bottom: AppSpaces.kSpace16),
                  child: CustomButton(
                    height: 55,
                    text:
                        'Checkout ${(cubit.getTotal(cubit.cartItems) + 100).toStringAsFixed(2)}\$',
                    backgroundColor: AppConstants.kSecondaryColor,
                    textColor: Colors.white,
                    onPressed: () async {
                      if (cubit.chosenPaymentMethod == PaymentMethods.card) {
                        final paymentIntentInputModel = PaymentIntentInputModel(
                          amount: (cubit.getTotal(cubit.cartItems) + 100)
                              .toStringAsFixed(0),
                          currency: 'USD',
                          customerId: ApiKeys.customerId,
                        );

                        await cubit
                            .makeStripePayment(
                          paymentIntentInputModel: paymentIntentInputModel,
                        )
                            .then((value) {
                          cubit.removeCart();
                          GoRouter.of(context).pushReplacement(
                            AppRouter.kThankYouView,
                            extra: {
                              'date': DateTime.now(),
                              'total': (cubit.getTotal(cubit.cartItems) + 100)
                                  .toStringAsFixed(2),
                            },
                          );
                        });
                      } else {
                        final amountModel = AmountModel(
                          total: (cubit.getTotal(cubit.cartItems) + 100)
                              .toStringAsFixed(2),
                          currency: 'USD',
                          details: Details(
                            subtotal: cubit
                                .getTotal(cubit.cartItems)
                                .toStringAsFixed(2),
                            shipping: (AppConstants.kShipmentFee +
                                    AppConstants.kTaxFee)
                                .toString(),
                            shippingDiscount: 0,
                          ),
                        );
                        final items = cubit.cartItems
                            .map(
                              (item) => Order(
                                name: item.title,
                                quantity: item.quantity,
                                price: item.price.toStringAsFixed(2),
                                currency: 'USD',
                              ),
                            )
                            .toList();
                        final itemsList = ItemsListModel(orders: items);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => cubit.makePaypalPayment(
                                transactionData: {
                                  'date': DateTime.now(),
                                  'total':
                                      (cubit.getTotal(cubit.cartItems) + 100)
                                          .toStringAsFixed(2),
                                },
                                context: context,
                                amount: amountModel,
                                items: itemsList,
                                onSuccess: () {
                                  cubit.removeCart();
                                }),
                          ),
                        );
                      }
                    },
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(AppSpaces.kSpace24),
                  child: Center(
                    child: Text(
                      'No items in the Cart yet!',
                      style: AppStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
