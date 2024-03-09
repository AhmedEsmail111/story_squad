import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_squad/core/utils/spaces.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  final String rating;
  final String numberOfVotes;
  final MainAxisAlignment mainAxisAlignment;
  const BookRating({
    super.key,
    required this.rating,
    required this.numberOfVotes,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 14,
        ),
        const SizedBox(
          width: AppSpaces.kSpace6,
        ),
        Text(
          rating,
          style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: AppSpaces.kSpace5,
        ),
        Text(
          numberOfVotes,
          style: AppStyles.textStyle14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
