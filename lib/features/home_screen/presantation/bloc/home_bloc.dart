import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/nowplaying_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/popular_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/toprated_movies.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/trending_movies.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app_clean_bloc/features/home_screen/domain/usecases/upcoming_movies.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/movie.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TredingMovies _tredingMovies;
  final NowPlayingMoviesUseCase _nowPlayingMoviesUseCase;
  final PopularMoviesUseCase _popularMoviesUseCase;
  final TopRatedMoviesUseCase _topRatedMoviesUseCase;
  final UpcomingMoviesUseCase _upcomingMoviesUseCase;
  HomeBloc({
    required TredingMovies tredingMovies,
    required NowPlayingMoviesUseCase nowPlayingMoviesUseCase,
    required PopularMoviesUseCase popularMoviesUseCase,
    required TopRatedMoviesUseCase topRatedMoviesUseCase,
    required UpcomingMoviesUseCase upcomingMoviesUseCase,
  })  : _tredingMovies = tredingMovies,
        _nowPlayingMoviesUseCase = nowPlayingMoviesUseCase,
        _popularMoviesUseCase = popularMoviesUseCase,
        _topRatedMoviesUseCase = topRatedMoviesUseCase,
        _upcomingMoviesUseCase = upcomingMoviesUseCase,
        super(HomeInitial()) {
    on<FetchTredingMovies>(_fetchTrendingMovies);
    on<FetchNowPlayingMovies>(_fetchNowPlayingMovies);
    on<FetchUpcomingMovies>(_fetchUpcomingMovies);
    on<FetchTopRatedMovies>(_fetchTopRatedMovies);
    on<FetchPopularMovies>(_fetchPopularMovies);
  }

  void _fetchTrendingMovies(
      FetchTredingMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final res = await _tredingMovies(NoParams());
    res.fold((l) => emit(HomeFailure(massage: l.message)),
        (r) => emit(TrendigMovieLoaded(trandingMovies: r)));
  }

  void _fetchNowPlayingMovies(
      FetchNowPlayingMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final res = await _nowPlayingMoviesUseCase(NoParams());
    res.fold((l) => emit(HomeFailure(massage: l.message)),
        (r) => emit(HomeSuccess(movie: r)));
  }

  void _fetchUpcomingMovies(
      FetchUpcomingMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final res = await _upcomingMoviesUseCase(NoParams());
    res.fold((l) => emit(HomeFailure(massage: l.message)),
        (r) => emit(HomeSuccess(movie: r)));
  }

  void _fetchPopularMovies(
      FetchPopularMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final res = await _popularMoviesUseCase(NoParams());
    res.fold((l) => emit(HomeFailure(massage: l.message)),
        (r) => emit(HomeSuccess(movie: r)));
  }

  void _fetchTopRatedMovies(
      FetchTopRatedMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final res = await _topRatedMoviesUseCase(NoParams());
    res.fold((l) => emit(HomeFailure(massage: l.message)),
        (r) => emit(TopRatedMovieLoaded(topRatedMovies: r)));
  }
}
