import 'package:fpdart/fpdart.dart';
import 'package:movie_app_clean_bloc/core/errors/failure.dart';
import 'package:movie_app_clean_bloc/features/home_screen/data/datasources/movie_remote_data_sources.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/entities/movie.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/repository/tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  TmdbRepositoryImpl(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final res = await movieRemoteDataSource.getNowPlayingMovies();
      return right(res);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final res = await movieRemoteDataSource.getPopularMovies();
      return right(res);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final res = await movieRemoteDataSource.getTopRatedMovies();
      return right(res);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTredingMovies() async {
    try {
      final res = await movieRemoteDataSource.getTredingMovies();
      return right(res);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies() async {
    try {
      final res = await movieRemoteDataSource.getUpcomingMovies();
      return right(res);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
