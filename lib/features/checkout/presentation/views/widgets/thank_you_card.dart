import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:story_squad/core/utils/spaces.dart';

import '../../../../../core/utils/styles.dart';
import 'card_info.dart';
import 'order_info_item.dart';
import 'paid_row.dart';
import 'total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
    required this.transactionData,
  });
  final Map<String, dynamic> transactionData;
  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd / MM / yyyy');
    final timeFormatter = DateFormat('hh:mm a');
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xffEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 + 16,
          left: 22,
          right: 22,
        ),
        child: Column(
          children: [
            Text(
              'Thank You',
              textAlign: TextAlign.center,
              style: AppStyles.textStyle30.copyWith(color: Colors.black),
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: AppStyles.textStyle16.copyWith(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: AppSpaces.kSpace30,
            ),
            OrderInfoItem(
              title: 'Date',
              value: formatter.format(transactionData['date']),
              isThankYou: true,
            ),
            const SizedBox(
              height: AppSpaces.kSpace12,
            ),
            OrderInfoItem(
              title: 'Time',
              value: timeFormatter.format(transactionData['date']),
              isThankYou: true,
            ),
            const SizedBox(
              height: AppSpaces.kSpace12,
            ),
            const Divider(
              height: 40,
              color: Color(0xffC7C7C7),
              thickness: 2,
            ),
            TotalPrice(
              title: 'Total',
              value: '${transactionData['total']}\$',
            ),
            const SizedBox(
              height: AppSpaces.kSpace30,
            ),
            const CardInfoContainer(),
            const Spacer(),
            const PaidSignRow(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.09,
            ),
          ],
        ),
      ),
    );
  }
}
