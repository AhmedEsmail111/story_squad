import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:story_squad/core/utils/functions/get_it__locater.dart';
import 'package:story_squad/core/utils/simple_bloc_observer.dart';
import 'package:story_squad/features/home/data/repos/home_repo_impl.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/domain/use_cases/fetch_featured_books_case.dart';
import 'package:story_squad/features/home/domain/use_cases/fetch_newest_books_case.dart';
import 'package:story_squad/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:story_squad/features/home/presentation/manager/newest_books/newest_books_cubit.dart';

import '/core/utils/constants.dart';
import '/core/utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerSingletonObjects();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(AppConstants.kFeaturedBox);
  await Hive.openBox<BookEntity>(AppConstants.kNewestBox);

  Bloc.observer = const SimpleBlocObserver();
  runApp(const StorySquad());
}

class StorySquad extends StatelessWidget {
  const StorySquad({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            fetchFeaturedBooksCase: FetchFeaturedBooksCase(
              homeRepo: locater.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            fetchNewestBooksCase: FetchNewestBooksCase(
              homeRepo: locater.get<HomeRepoImpl>(),
            ),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppConstants.kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
