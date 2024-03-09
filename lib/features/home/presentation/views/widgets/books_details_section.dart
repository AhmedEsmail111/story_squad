import 'package:flutter/material.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';

import '../../../../../core/utils/spaces.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});

  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.30),
          child: CustomBookImage(
            image: bookEntity.image,
          ),
        ),
        const SizedBox(
          height: AppSpaces.kSpace40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kSpace24),
          child: Text(
            bookEntity.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textStyle30.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: AppSpaces.kSpace6,
        ),
        Text(
          bookEntity.authorName,
          style: AppStyles.textStyle18.copyWith(
            fontStyle: FontStyle.italic,
            color: Colors.white38,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: AppSpaces.kSpace16,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookEntity.rating.toString(),
          numberOfVotes: '(2349)',
        ),
      ],
    );
  }
}
