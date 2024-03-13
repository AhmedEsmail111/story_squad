import 'package:flutter/material.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';
import 'package:story_squad/features/checkout/presentation/views/widgets/order_tile.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.cart});

  final List<OrderEntity> cart;

  @override
  Widget build(BuildContext context) {
    print(cart.length);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: cart.length,
      itemBuilder: (ctx, index) => OrderTile(
        orderEntity: cart[index],
      ),
      separatorBuilder: (ctx, index) =>
          const SizedBox(height: AppSpaces.kSpace16),
    );
  }
}
