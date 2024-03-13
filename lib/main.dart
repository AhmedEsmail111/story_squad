import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:story_squad/core/utils/api_keys.dart';
import 'package:story_squad/features/checkout/data/repos/checkout_repo_impl.dart';

import '/core/utils/constants.dart';
import '/core/utils/router.dart';
import 'core/utils/functions/get_it__locater.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/checkout/data/use_cases/add_to_cart_case.dart';
import 'features/checkout/data/use_cases/change_quantity_case.dart';
import 'features/checkout/data/use_cases/get_cart_case.dart';
import 'features/checkout/data/use_cases/make_stripe_payment_case.dart';
import 'features/checkout/data/use_cases/remove_cart_case.dart';
import 'features/checkout/data/use_cases/remove_from_cart_case.dart';
import 'features/checkout/domain/entities/order_entity.dart';
import 'features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'features/home/domain/entities/book_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initMain();

  runApp(const StorySquad());
}

class StorySquad extends StatelessWidget {
  const StorySquad({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(
        checkoutRepo: locater.get<CheckoutRepoImpl>(),
        addToCartCase: locater.get<AddToCartCase>(),
        removeFromCartCase: locater.get<RemoveFromCartCase>(),
        getCartCase: locater.get<GetCartCase>(),
        removeCartCase: locater.get<RemoveCartCase>(),
        changeQuantityCase: locater.get<ChangeQuantityCase>(),
        makeStripePaymentCase: locater.get<MakeStripePaymentCase>(),
      )..getCart(),
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

Future<void> initMain() async {
  registerSingletonObjects();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  Hive.registerAdapter(OrderEntityAdapter());
  await Hive.openBox<BookEntity>(AppConstants.kFeaturedBox);
  await Hive.openBox<BookEntity>(AppConstants.kNewestBox);
  await Hive.openBox<OrderEntity>(AppConstants.kCartBox);
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = const SimpleBlocObserver();
}
