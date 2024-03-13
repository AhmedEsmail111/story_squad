import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:story_squad/core/utils/assets.dart';

import '../../../../../core/utils/styles.dart';

class CardInfoContainer extends StatelessWidget {
  const CardInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.kCardImage),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                'Credit Card',
                textAlign: TextAlign.center,
                style: AppStyles.textStyle16.copyWith(color: Colors.black),
              ),
              Text(
                'Mastercard **78',
                textAlign: TextAlign.center,
                style: AppStyles.textStyle16.copyWith(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
