import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/features/search/data/repos/search_repo_impl.dart';

import '../../../../core/utils/functions/get_it__locater.dart';
import '../../domain/use_cases/fetch_filtered_books_case.dart';
import '../manager/search_cubit/search_cubit.dart';
import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        fetchFilteredBooksCase: FetchFilteredBooksCase(
          searchRepo: locater.get<SearchRepoImpl>(),
        ),
      ),
      child: const Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
