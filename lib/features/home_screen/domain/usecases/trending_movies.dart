import 'package:fpdart/fpdart.dart';
import 'package:movie_app_clean_bloc/core/errors/failure.dart';
import 'package:movie_app_clean_bloc/core/usecase/usecase.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/repository/tmdb_repository.dart';

import '../entities/movie.dart';

class TredingMovies implements UseCase<List<Movie>, NoParams> {
  TmdbRepository tmdbRepository;
  TredingMovies(
    this.tmdbRepository,
  );
  @override
  Future<Either<Failure, List<Movie>>> call(params) {
    return tmdbRepository.getTredingMovies();
  }
}
