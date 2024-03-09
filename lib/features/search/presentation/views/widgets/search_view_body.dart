import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/features/search/presentation/views/widgets/search_results_list_view_bloc_consumer.dart';

import '../../../../../core/utils/spaces.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/search_cubit/search_cubit.dart';
import 'custom_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
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
        await BlocProvider.of<SearchCubit>(context).fetchFilteredBooks(
          pageNumber: _nextPage++,
          query: BlocProvider.of<SearchCubit>(context).query,
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
    return SingleChildScrollView(
      controller: _scrollController,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppSpaces.kSpace30,
              right: AppSpaces.kSpace30,
              bottom: AppSpaces.kSpace20,
              top: AppSpaces.kSpace16,
            ),
            child: CustomTextField(),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppSpaces.kSpace30,
            ),
            child: Text(
              'Search Results',
              style: AppStyles.textStyle18,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SearchResultsListViewBlocConsumer(),
        ],
      ),
    );
  }
}
