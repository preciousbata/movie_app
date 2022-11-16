import 'package:get_it/get_it.dart';
import 'package:movie_app/repository/top_rated_movie_repository.dart';
import 'package:movie_app/repository/trending_repository.dart';
import 'package:movie_app/src/core/api_provider.dart';
import 'package:movie_app/src/data/data_source/get_movie_remote_data_source.dart';
import 'package:movie_app/src/data/repositories/get_movie_repo_impl.dart';
import 'package:movie_app/src/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movie_app/src/domain/usecases/get_trending_movie_usecase.dart';
import 'package:movie_app/src/domain/usecases/get_trending_tv_show_usecase.dart';
import 'package:movie_app/utils/movies_service.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(
      () => TrendingRepository(sl.get()));
  sl.registerFactory(() => ApiService());
  sl.registerLazySingleton(() => TopRatedMoviesRepository(sl.get()));

  //use_cases
  sl.registerLazySingleton(() => GetTopRatedMovieUseCase(sl.get()));
  sl.registerLazySingleton(() => GetTrendingTvShowUseCase(sl.get()));
  sl.registerLazySingleton(() => GetTrendingMovieUseCase(sl.get()));

  // Data Sources
  sl.registerLazySingleton(() => GetMovieRemoteDataSourceImpl(apiProvider: sl.get()));

  // Core
  sl.registerLazySingleton(() => ApiProvider());

  //Repo
  sl.registerLazySingleton(() => GetMovieRepoImpl(sl.get()));
}
