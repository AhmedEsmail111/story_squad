import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:story_squad/core/utils/api_service.dart';
import 'package:story_squad/features/home/data/data_sources/local_data_source.dart';
import 'package:story_squad/features/home/data/data_sources/remote_data_source.dart';
import 'package:story_squad/features/home/data/repos/home_repo_impl.dart';

import '../../../features/search/data/data_sources/remote_search_data_source.dart';
import '../../../features/search/data/repos/search_repo_impl.dart';

final locater = GetIt.instance;

void registerSingletonObjects() {
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
