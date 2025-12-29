class MoreLikeThisModel {
  final int id;
  final String? title;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String? releaseDate;

  MoreLikeThisModel({
    required this.id,
    this.title,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    this.releaseDate,
  });

  factory MoreLikeThisModel.fromJson(Map<String, dynamic> json) {
    return MoreLikeThisModel(
      id: json['id'] ?? 0,
      title: json['title'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: json['release_date'],
    );
  }
}
