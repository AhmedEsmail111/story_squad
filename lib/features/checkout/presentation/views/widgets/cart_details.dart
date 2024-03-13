import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/spaces.dart';
import 'order_info_item.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({super.key, required this.subtotal});
  final num subtotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpaces.kSpace16,
        vertical: AppSpaces.kSpace8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpaces.kBorderRadius8),
        border: Border.all(color: AppConstants.kFadingColor.withOpacity(0.8)),
      ),
      child: Column(
        children: [
          OrderInfoItem(
            title: 'Order SubTotal',
            value: '${subtotal.toStringAsFixed(2)}\$',
          ),
          const SizedBox(
            height: AppSpaces.kSpace3,
          ),
          const OrderInfoItem(
            title: 'Tax',
            value: '${AppConstants.kTaxFee}\$',
          ),
          const SizedBox(
            height: AppSpaces.kSpace3,
          ),
          const OrderInfoItem(
            title: 'Shipment Fee',
            value: '${AppConstants.kTaxFee}\$',
          ),
          const SizedBox(
            height: AppSpaces.kSpace3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          const SizedBox(
            height: AppSpaces.kSpace3,
          ),
          OrderInfoItem(
            title: 'Total',
            value: '${(subtotal + 45).toStringAsFixed(2)}\$',
          ),
        ],
      ),
    );
  }
}
