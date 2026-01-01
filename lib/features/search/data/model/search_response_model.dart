import 'package:equatable/equatable.dart';
import 'search_movie_model.dart';

class SearchResponseModel extends Equatable {
  final int page;
  final List<SearchMovieModel> results;
  final int totalPages;
  final int totalResults;

  const SearchResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      page: json['page'] ?? 1,
      results:
          (json['results'] as List<dynamic>?)
              ?.map((e) => SearchMovieModel.fromJson(e))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 1,
      totalResults: json['total_results'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
