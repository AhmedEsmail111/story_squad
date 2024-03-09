import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_squad/core/utils/constants.dart';
import 'package:story_squad/core/utils/router.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/presentation/views/widgets/book_rating.dart';

import '../utils/styles.dart';

class BookTileItem extends StatelessWidget {
  const BookTileItem({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kBookDetailsView, extra: bookEntity);
      },
      child: SizedBox(
        height: 125,
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
                  imageUrl: bookEntity.image,
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
                      bookEntity.title,
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
                      bookEntity.authorName,
                      style: AppStyles.textStyle14.copyWith(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: AppSpaces.kSpace3,
                  ),
                  Row(
                    children: [
                      Text(
                        bookEntity.price == 0.0
                            ? 'Free'
                            : '${bookEntity.price}\$',
                        style: AppStyles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookEntity.rating.toString(),
                        numberOfVotes: '(2436)',
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
