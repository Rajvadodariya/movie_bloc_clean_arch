part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class FetchTredingMovies extends HomeEvent {}

final class FetchTopRatedMovies extends HomeEvent {}

final class FetchNowPlayingMovies extends HomeEvent {}

final class FetchPopularMovies extends HomeEvent {}

final class FetchUpcomingMovies extends HomeEvent {}
