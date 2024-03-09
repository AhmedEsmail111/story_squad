import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/core/utils/functions/get_it__locater.dart';
import 'package:story_squad/features/home/data/repos/home_repo_impl.dart';
import 'package:story_squad/features/home/domain/use_cases/fetch_similar_books_case.dart';
import 'package:story_squad/features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:story_squad/features/home/presentation/views/widgets/similar_books_list_bloc_consumer.dart';

import '../../../../../core/utils/spaces.dart';
import '../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.similarity});

  final String similarity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarBooksCubit(
        fetchSimilarBooksCase: FetchSimilarBooksCase(
          homeRepo: locater.get<HomeRepoImpl>(),
        ),
      )..fetchSimilarBooks(similarity: similarity),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: AppSpaces.kSpace30),
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also like',
              style: AppStyles.textStyle14.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: AppSpaces.kSpace16,
          ),
          const SimilarBooksListBlocConsumer(),
        ],
      ),
    );
  }
}
