import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/core/utils/functions/get_it__locater.dart';
import 'package:story_squad/features/home/data/repos/home_repo_impl.dart';
import 'package:story_squad/features/home/domain/use_cases/fetch_category_books_case.dart';
import 'package:story_squad/features/home/presentation/manager/category_books/category_books_cubit.dart';

import 'widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBooksCubit(
        fetchCategoryBooksCase: FetchCategoryBooksCase(
          homeRepo: locater.get<HomeRepoImpl>(),
        ),
      )..fetchCategoryBooks(category: category),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(category),
        ),
        body: CategoryViewBody(
          category: category,
        ),
      ),
    );
  }
}
