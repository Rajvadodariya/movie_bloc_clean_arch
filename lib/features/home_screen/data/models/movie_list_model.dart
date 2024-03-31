class MovieLists {
  int? page;
  List<NowPlayingResult>? nowPlayingResult;
  int? totalPages;

  MovieLists({this.page, this.nowPlayingResult, this.totalPages});

  factory MovieLists.fromJson(Map<String, dynamic> json) {
    return MovieLists(
        page: json['page'],
        nowPlayingResult: (json['results'] as List)
            .map((item) => NowPlayingResult.fromJson(item))
            .toList(),
        totalPages: json['total_pages']);
  }

  Map<String, dynamic> toJson() => {'page': page, 'results': nowPlayingResult};
}

class NowPlayingResult {
  int? id;
  String? title;
  String? posterPath;

  NowPlayingResult({
    this.id,
    required this.title,
    required this.posterPath,
  });

  factory NowPlayingResult.fromJson(Map<String, dynamic> json) {
    return NowPlayingResult(
        id: json['id'],
        title: json['original_title'],
        posterPath: json['poster_path']);
  }

  Map<String, dynamic> toJson() =>
      {'original_title': title, 'poster_path': posterPath};
}