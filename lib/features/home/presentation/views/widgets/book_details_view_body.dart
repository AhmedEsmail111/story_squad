import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/core/utils/functions/get_it__locater.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';
import 'package:story_squad/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:story_squad/features/home/data/repos/home_repo_impl.dart';
import 'package:story_squad/features/home/presentation/manager/preview_price_cubit/preview_price_cubit.dart';
import 'package:story_squad/features/home/presentation/views/widgets/action_buttons_row.dart';

import '../../../domain/entities/book_entity.dart';
import 'books_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.bookEntity,
  });

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              BlocBuilder<CheckoutCubit, CheckoutStates>(
                builder: (context, state) {
                  final cubit = context.read<CheckoutCubit>();
                  final orderEntity = OrderEntity(
                    bookId: bookEntity.bookId,
                    image: bookEntity.image,
                    title: bookEntity.title,
                    authorName: bookEntity.authorName,
                    price: bookEntity.price,
                    quantity: 1,
                  );
                  return CustomBookDetailsAppBar(
                    id: bookEntity.bookId,
                    onPressed: cubit.isInCart(bookEntity.bookId)
                        ? () {
                            cubit.changeQuantity(
                              quantity:
                                  (cubit.inCartItems[bookEntity.bookId]! + 1),
                              orderId: orderEntity.bookId,
                            );
                          }
                        : () {
                            cubit.addToCart(orderEntity: orderEntity);
                          },
                  );
                },
              ),
              const SizedBox(
                height: AppSpaces.kSpace20,
              ),
              BookDetailsSection(
                bookEntity: bookEntity,
              ),
              const SizedBox(
                height: AppSpaces.kSpace30 + AppSpaces.kSpace6,
              ),
              BlocProvider(
                create: (context) => PreviewPriceCubit(
                  homeRepo: locater.get<HomeRepoImpl>(),
                ),
                child: ActionButtonsRow(
                  url: bookEntity.previewUrl,
                  price: bookEntity.price,
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: AppSpaces.kSpace50,
                ),
              ),
              SimilarBooksSection(
                similarity: bookEntity.title,
              ),
              const SizedBox(
                height: AppSpaces.kSpace30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
