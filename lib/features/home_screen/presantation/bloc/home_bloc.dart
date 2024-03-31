import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/trending_movies.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entities/movie.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TredingMovies _tredingMovies;
  HomeBloc(TredingMovies tredingMovies)
      : _tredingMovies = tredingMovies,
        super(HomeInitial()) {
    on<FetchTredingMovies>(_fetchMovies);
  }

  void _fetchMovies(FetchTredingMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final res = await _tredingMovies(NoParams());
    res.fold((l) => emit(HomeFailure(massage: l.message)),
        (r) => emit(HomeSuccess(movie: r)));
  }
}
