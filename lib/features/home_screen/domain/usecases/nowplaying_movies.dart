import 'package:fpdart/fpdart.dart';
import 'package:movie_app_clean_bloc/core/errors/failure.dart';
import 'package:movie_app_clean_bloc/core/usecase/usecase.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/entities/movie.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/repository/tmdb_repository.dart';

class NowPlayingMoviesUseCase implements UseCase<List<Movie>, NoParams> {
  TmdbRepository tmdbRepository;
  NowPlayingMoviesUseCase(this.tmdbRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return tmdbRepository.getNowPlayingMovies();
  }
}
