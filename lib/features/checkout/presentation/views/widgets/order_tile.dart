import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';
import 'package:story_squad/features/checkout/presentation/manager/checkout/checkout_cubit.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/spaces.dart';
import '../../../../../core/utils/styles.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                AppSpaces.kBorderRadius8,
              ),
              child: CachedNetworkImage(
                errorWidget: (ctx, str, obj) => Container(
                  color: AppConstants.kFadingColor,
                ),
                imageUrl: orderEntity.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: AppSpaces.kSpace30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Text(
                    orderEntity.title,
                    style: AppStyles.textStyle20
                        .copyWith(fontFamily: AppConstants.kGtSectraFine),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: AppSpaces.kSpace3,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Text(
                    orderEntity.authorName,
                    style: AppStyles.textStyle14.copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                BlocConsumer<CheckoutCubit, CheckoutStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final cubit = BlocProvider.of<CheckoutCubit>(context);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            cubit.changeQuantity(
                              quantity: (orderEntity.quantity + 1),
                              orderId: orderEntity.bookId,
                            );
                          },
                          icon: const Icon(Icons.add),
                        ),
                        const SizedBox(
                          width: AppSpaces.kSpace5,
                        ),
                        Text(orderEntity.quantity.toString()),
                        const SizedBox(
                          width: AppSpaces.kSpace5,
                        ),
                        IconButton(
                          onPressed: () {
                            if (orderEntity.quantity > 1) {
                              cubit.changeQuantity(
                                quantity: (orderEntity.quantity - 1),
                                orderId: orderEntity.bookId,
                              );
                            } else {
                              cubit.removeFromCart(orderEntity: orderEntity);
                            }
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        const Spacer(),
                        Text(
                          orderEntity.price * orderEntity.quantity == 0
                              ? 'Free'
                              : "${(orderEntity.price * orderEntity.quantity).toStringAsFixed(2)}\$",
                          style: AppStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
