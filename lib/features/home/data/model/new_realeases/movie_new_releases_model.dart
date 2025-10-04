import 'package:equatable/equatable.dart';

class MovieNewReleasesModel extends Equatable {
  final int id;
  final String title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final String? originalLanguage;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final bool adult;
  final bool video;
  final List<int> genreIds;

  const MovieNewReleasesModel({
    required this.id,
    required this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.originalLanguage,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.adult,
    required this.video,
    required this.genreIds,
  });

  factory MovieNewReleasesModel.fromJson(Map<String, dynamic> json) {
    return MovieNewReleasesModel(
      id: json['id'],
      title: json['title'] ?? '',
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      originalLanguage: json['original_language'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      popularity: (json['popularity'] ?? 0).toDouble(),
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'release_date': releaseDate,
      'original_language': originalLanguage,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'popularity': popularity,
      'adult': adult,
      'video': video,
      'genre_ids': genreIds,
    };
  }

  @override
  List<Object?> get props => [
    id,
    title,
    originalTitle,
    overview,
    posterPath,
    backdropPath,
    releaseDate,
    originalLanguage,
    voteAverage,
    voteCount,
    popularity,
    adult,
    video,
    genreIds,
  ];
}
