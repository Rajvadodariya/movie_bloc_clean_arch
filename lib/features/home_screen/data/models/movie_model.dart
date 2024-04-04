import 'package:movie_app_clean_bloc/features/home_screen/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.movieTitle,
      required super.posterPath,
      required super.id,
      required super.mediaType});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'] ?? '',
        movieTitle: json['original_title'] ?? '',
        posterPath: json['poster_path'] ?? '',
        mediaType: json['media_type'] ?? '');
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'original_title': movieTitle, 'poster_path': posterPath};
}
