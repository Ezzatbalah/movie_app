import 'package:equatable/equatable.dart';
import 'recommended_movie.dart';

class RecommendedModel extends Equatable {
  final int? page;
  final List<RecommendedMovie>? results;
  final int? totalPages;
  final int? totalResults;

  const RecommendedModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory RecommendedModel.fromJson(Map<String, dynamic> json) {
    return RecommendedModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((item) => RecommendedMovie.fromJson(item))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'results': results?.map((m) => m.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
