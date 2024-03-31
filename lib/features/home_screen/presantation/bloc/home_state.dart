part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeFailure extends HomeState {
  final String massage;
  HomeFailure({required this.massage});
}

final class HomeSuccess extends HomeState {
  final List<Movie> movie;
  HomeSuccess({required this.movie});
}