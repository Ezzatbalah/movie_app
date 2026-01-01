import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/utils/api_services.dart';
import 'package:movie_app/features/home/data/repo/home_repo_impl.dart';
import 'package:movie_app/features/search/data/repo/searchRepoImpl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<searchRepoImpl>(
    searchRepoImpl(getIt.get<ApiServices>()),
  );
}
