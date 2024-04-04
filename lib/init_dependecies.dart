import 'package:get_it/get_it.dart';
import 'package:movie_app_clean_bloc/features/home_screen/data/datasources/movie_remote_data_sources.dart';
import 'package:movie_app_clean_bloc/features/home_screen/data/repository/tmdb_repository_impl.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/repository/tmdb_repository.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/nowplaying_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/popular_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/toprated_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/trending_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/upcoming_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/presantation/bloc/home_bloc.dart';

final serviceLocator = GetIt.instance;

void initDependecies() {
  _fetchMovieLists();
}

void _fetchMovieLists() {
  serviceLocator.registerFactory<MovieRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl());

  serviceLocator.registerFactory<TmdbRepository>(
      () => TmdbRepositoryImpl(serviceLocator()));

  serviceLocator.registerFactory(() => TredingMovies(serviceLocator()));

  serviceLocator
      .registerFactory(() => NowPlayingMoviesUseCase(serviceLocator()));

  serviceLocator.registerFactory(() => PopularMoviesUseCase(serviceLocator()));

  serviceLocator.registerFactory(() => UpcomingMoviesUseCase(serviceLocator()));

  serviceLocator.registerFactory(() => TopRatedMoviesUseCase(serviceLocator()));

  serviceLocator.registerLazySingleton(() => HomeBloc(
        tredingMovies: serviceLocator(),
        nowPlayingMoviesUseCase: serviceLocator(),
        popularMoviesUseCase: serviceLocator(),
        topRatedMoviesUseCase: serviceLocator(),
        upcomingMoviesUseCase: serviceLocator(),
      ));
}
