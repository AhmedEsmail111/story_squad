import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/get_it__locater.dart';
import '../../data/repos/home_repo_impl.dart';
import '../../domain/use_cases/fetch_featured_books_case.dart';
import '../../domain/use_cases/fetch_newest_books_case.dart';
import '../manager/featured_books/featured_books_cubit.dart';
import '../manager/newest_books/newest_books_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewestBooksCubit(
            fetchNewestBooksCase: FetchNewestBooksCase(
              homeRepo: locater.get<HomeRepoImpl>(),
            ),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            fetchFeaturedBooksCase: FetchFeaturedBooksCase(
              homeRepo: locater.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks(),
        ),
      ],
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
