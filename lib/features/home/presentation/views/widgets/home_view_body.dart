import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/features/home/presentation/views/widgets/categories_list.dart';
import 'package:story_squad/features/home/presentation/views/widgets/recently_added_list_view_bloc_consumer.dart';

import '../../../../../core/utils/styles.dart';
import '../../manager/newest_books/newest_books_cubit.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view_bloc_concumer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
        await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
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
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(
                  height: AppSpaces.kSpace30,
                ),
                FeaturedBooksListViewBlocConsumer(),
                SizedBox(
                  height: AppSpaces.kSpace50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppSpaces.kSpace30),
                  child: Text(
                    'Popular Categories',
                    style: AppStyles.textStyle18,
                  ),
                ),
                SizedBox(
                  height: AppSpaces.kSpace8 + AppSpaces.kSpace3,
                ),
                CategoriesList(),
                SizedBox(
                  height: AppSpaces.kSpace20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppSpaces.kSpace30),
                  child: Text(
                    'Recently Added',
                    style: AppStyles.textStyle18,
                  ),
                ),
                SizedBox(
                  height: AppSpaces.kSpace20,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: RecentlyAddedListViewBlocConsumer(),
          ),
        ],
      ),
    );
  }
}
