import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/movie.dart';

abstract interface class TmdbRepository {
  Future<Either<Failure, List<Movie>>> getTredingMovies();
  Future<Either<Failure, List<Movie>>> getUpcomingMovies();
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
}
