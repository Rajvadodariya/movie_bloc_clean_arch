import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_bloc/features/home_screen/data/datasources/movie_remote_data_sources.dart';
import 'package:movie_app_clean_bloc/features/home_screen/data/repository/tmdb_repository_impl.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/nowplaying_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/popular_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/toprated_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/trending_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/upcoming_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/presantation/bloc/home_bloc.dart';
import 'package:movie_app_clean_bloc/features/home_screen/presantation/pages/home_page.dart';
import 'package:movie_app_clean_bloc/init_dependecies.dart';

void main() {
  initDependecies();
  runApp(MultiBlocProvider(
    providers: [
      // BlocProvider(create: (_) => serviceLocator<HomeBloc>()),
      BlocProvider(
          create: (_) => HomeBloc(
              tredingMovies: TredingMovies(
                  TmdbRepositoryImpl(MoviesRemoteDataSourceImpl())),
              nowPlayingMoviesUseCase: NowPlayingMoviesUseCase(
                  TmdbRepositoryImpl(MoviesRemoteDataSourceImpl())),
              popularMoviesUseCase: PopularMoviesUseCase(
                  TmdbRepositoryImpl(MoviesRemoteDataSourceImpl())),
              topRatedMoviesUseCase: TopRatedMoviesUseCase(
                  TmdbRepositoryImpl(MoviesRemoteDataSourceImpl())),
              upcomingMoviesUseCase: UpcomingMoviesUseCase(
                  TmdbRepositoryImpl(MoviesRemoteDataSourceImpl())))),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme:
            const TextTheme(bodyMedium: TextStyle(color: Colors.white)).apply(),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
