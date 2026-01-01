import 'package:equatable/equatable.dart';

class SearchMovieModel extends Equatable {
  final int id;
  final String title;
  final String? originalTitle;
  final String? overview;
  final String? releaseDate;
  final String? posterPath;
  final String? backdropPath;
  final bool adult;
  final bool video;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final String originalLanguage;
  final List<int> genreIds;

  const SearchMovieModel({
    required this.id,
    required this.title,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
    required this.adult,
    required this.video,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.originalLanguage,
    required this.genreIds,
  });

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) {
    return SearchMovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalTitle: json['original_title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
      popularity: (json['popularity'] ?? 0).toDouble(),
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      originalLanguage: json['original_language'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    originalTitle,
    overview,
    releaseDate,
    posterPath,
    backdropPath,
    adult,
    video,
    popularity,
    voteAverage,
    voteCount,
    originalLanguage,
    genreIds,
  ];
}
