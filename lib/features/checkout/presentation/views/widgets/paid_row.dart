import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:story_squad/core/utils/assets.dart';

import '../../../../../core/utils/styles.dart';

class PaidSignRow extends StatelessWidget {
  const PaidSignRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          AppAssets.kPaidMark,
          height: 60,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff34A853), width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            'PAID',
            style:
                AppStyles.textStyle18.copyWith(color: const Color(0xff34A853)),
          ),
        )
      ],
    );
  }
}
