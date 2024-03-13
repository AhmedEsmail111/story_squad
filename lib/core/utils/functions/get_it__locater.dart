import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:story_squad/core/utils/api_service.dart';
import 'package:story_squad/core/utils/paypal_service.dart';
import 'package:story_squad/features/checkout/data/data_sources/checkout_local_data_source.dart';
import 'package:story_squad/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:story_squad/features/checkout/data/use_cases/add_to_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/change_quantity_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/get_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/remove_cart_case.dart';
import 'package:story_squad/features/checkout/data/use_cases/remove_from_cart_case.dart';
import 'package:story_squad/features/home/data/data_sources/local_data_source.dart';
import 'package:story_squad/features/home/data/data_sources/remote_data_source.dart';
import 'package:story_squad/features/home/data/repos/home_repo_impl.dart';

import '../../../features/checkout/data/use_cases/make_stripe_payment_case.dart';
import '../../../features/search/data/data_sources/remote_search_data_source.dart';
import '../../../features/search/data/repos/search_repo_impl.dart';
import '../stripe_service.dart';

final locater = GetIt.instance;

void registerSingletonObjects() {
  locater.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  locater.registerSingleton<CheckoutRepoImpl>(
    CheckoutRepoImpl(
      paypalService: PaypalService(),
      checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
      stripeService: StripeService(
        apiService: locater.get<ApiService>(),
      ),
    ),
  );
  locater.registerSingleton<MakeStripePaymentCase>(
    MakeStripePaymentCase(
      checkoutRepo: CheckoutRepoImpl(
        paypalService: PaypalService(),
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
        stripeService: StripeService(
          apiService: locater.get<ApiService>(),
        ),
      ),
    ),
  );
  locater.registerSingleton<RemoveFromCartCase>(
    RemoveFromCartCase(
      checkoutRepo: CheckoutRepoImpl(
        paypalService: PaypalService(),
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
        stripeService: StripeService(
          apiService: locater.get<ApiService>(),
        ),
      ),
    ),
  );
  locater.registerSingleton<GetCartCase>(
    GetCartCase(
      checkoutRepo: CheckoutRepoImpl(
        paypalService: PaypalService(),
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
        stripeService: StripeService(
          apiService: locater.get<ApiService>(),
        ),
      ),
    ),
  );
  locater.registerSingleton<RemoveCartCase>(
    RemoveCartCase(
      checkoutRepo: CheckoutRepoImpl(
        paypalService: PaypalService(),
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
        stripeService: StripeService(
          apiService: locater.get<ApiService>(),
        ),
      ),
    ),
  );
  locater.registerSingleton<ChangeQuantityCase>(
    ChangeQuantityCase(
      checkoutRepo: CheckoutRepoImpl(
        paypalService: PaypalService(),
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
        stripeService: StripeService(
          apiService: locater.get<ApiService>(),
        ),
      ),
    ),
  );

  locater.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      remoteHomeDataSource: RemoteHomeDataSourceImpl(
        locater.get<ApiService>(),
      ),
      localHomeDataSource: LocalHomeDataSourceImpl(),
    ),
  );

  locater.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      remoteSearchDataSource: RemoteSearchDataSourceImpl(
        apiService: locater.get<ApiService>(),
      ),
    ),
  );

  locater.registerSingleton<AddToCartCase>(
    AddToCartCase(
      checkoutRepo: CheckoutRepoImpl(
        paypalService: PaypalService(),
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
        stripeService: StripeService(
          apiService: locater.get<ApiService>(),
        ),
      ),
    ),
  );
}
