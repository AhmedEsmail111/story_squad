import 'package:flutter/material.dart';
import 'package:story_squad/core/utils/constants.dart';
import 'package:story_squad/core/utils/spaces.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_lines.dart';
import 'thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key, required this.transactionData});
  final Map<String, dynamic> transactionData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppSpaces.kSpace30,
          right: AppSpaces.kSpace30,
          top: AppSpaces.kSpace50,
          bottom: AppSpaces.kSpace20,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ThankYouCard(
              transactionData: transactionData,
            ),
            Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * 0.25,
              child: const CircleAvatar(
                backgroundColor: AppConstants.kPrimaryColor,
              ),
            ),
            Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * 0.25,
              child: const CircleAvatar(
                backgroundColor: AppConstants.kPrimaryColor,
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: -50,
              child: CustomCheckIcon(),
            ),
            Positioned(
              left: 8 + 20,
              right: 8 + 20,
              bottom: MediaQuery.sizeOf(context).height * 0.25 + 20,
              child: const CustomDashedLines(),
            ),
          ],
        ),
      ),
    );
  }
}
