import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:story_squad/core/utils/api_service.dart';
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

import '../../../features/search/data/data_sources/remote_search_data_source.dart';
import '../../../features/search/data/repos/search_repo_impl.dart';

final locater = GetIt.instance;

void registerSingletonObjects() {
  locater.registerSingleton<AddToCartCase>(
    AddToCartCase(
      checkoutRepo: CheckoutRepoImpl(
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
      ),
    ),
  );
  locater.registerSingleton<RemoveFromCartCase>(
    RemoveFromCartCase(
      checkoutRepo: CheckoutRepoImpl(
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
      ),
    ),
  );
  locater.registerSingleton<GetCartCase>(
    GetCartCase(
      checkoutRepo: CheckoutRepoImpl(
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
      ),
    ),
  );
  locater.registerSingleton<RemoveCartCase>(
    RemoveCartCase(
      checkoutRepo: CheckoutRepoImpl(
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
      ),
    ),
  );
  locater.registerSingleton<ChangeQuantityCase>(
    ChangeQuantityCase(
      checkoutRepo: CheckoutRepoImpl(
        checkoutLocalDataSource: CheckoutLocalDataSourceImpl(),
      ),
    ),
  );

  locater.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
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
}
