import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_squad/core/utils/router.dart';
import 'package:story_squad/features/home/presentation/manager/featured_books/featured_books_cubit.dart';

import '/core/utils/spaces.dart';
import '/features/home/domain/entities/book_entity.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  bool _isLoading = false;
  int _nextPage = 1;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() async {
    final currentPosition = _scrollController.position.pixels;
    final maxLength = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxLength) {
      if (!_isLoading) {
        _isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
          pageNumber: _nextPage++,
        );
        _isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.28,
      child: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: AppSpaces.kSpace16),
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.kBookDetailsView,
              extra: widget.books[index],
            );
          },
          child: CustomBookImage(
            image: widget.books[index].image,
          ),
        ),
        separatorBuilder: (_, i) => const SizedBox(width: 12),
      ),
    );
  }
}
