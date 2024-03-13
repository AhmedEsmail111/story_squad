import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:story_squad/core/utils/functions/get_it__locater.dart';
import 'package:story_squad/core/utils/simple_bloc_observer.dart';
import 'package:story_squad/features/checkout/data/use_cases/add_to_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/change_quantity_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/get_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/remove_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/remove_from_cart_case.dart';
import 'package:story_squad/features/checkout/domain/entities/order_entity.dart';
import 'package:story_squad/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
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
  Hive.registerAdapter(OrderEntityAdapter());
  await Hive.openBox<BookEntity>(AppConstants.kFeaturedBox);
  await Hive.openBox<BookEntity>(AppConstants.kNewestBox);
  await Hive.openBox<OrderEntity>(AppConstants.kCartBox);

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
        BlocProvider(
          create: (context) => CheckoutCubit(
            addToCartCase: locater.get<AddToCartCase>(),
            removeFromCartCase: locater.get<RemoveFromCartCase>(),
            getCartCase: locater.get<GetCartCase>(),
            removeCartCase: locater.get<RemoveCartCase>(),
            changeQuantityCase: locater.get<ChangeQuantityCase>(),
          ),
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
