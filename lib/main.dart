import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_bloc/features/home_screen/data/datasources/movie_remote_data_sources.dart';
import 'package:movie_app_clean_bloc/features/home_screen/data/repository/tmdb_repository_impl.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/trending_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/presantation/bloc/home_bloc.dart';
import 'package:movie_app_clean_bloc/features/home_screen/presantation/pages/home_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => HomeBloc(
              TredingMovies(TmdbRepositoryImpl(MoviesRemoteDataSourceImpl())))),
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
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
