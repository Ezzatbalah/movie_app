import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/popular/movie_result.dart';

class PopularResponse extends Equatable {
  final int? page;
  final List<MovieResult>? results;
  final int? totalPages;
  final int? totalResults;

  const PopularResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory PopularResponse.fromJson(Map<String, dynamic> json) {
    return PopularResponse(
      page: json['page'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieResult.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'results': results?.map((e) => e.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
