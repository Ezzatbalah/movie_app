import 'package:equatable/equatable.dart';
import 'movie_new_releases_model.dart';
import 'new_releases_dates_model.dart';

class NewReleasesResponseModel extends Equatable {
  final NewReleasesDatesModel? dates;
  final int page;
  final List<MovieNewReleasesModel> results;
  final int totalPages;
  final int totalResults;

  const NewReleasesResponseModel({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NewReleasesResponseModel.fromJson(Map<String, dynamic> json) {
    return NewReleasesResponseModel(
      dates: json['dates'] != null
          ? NewReleasesDatesModel.fromJson(json['dates'])
          : null,
      page: json['page'] ?? 1,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieNewReleasesModel.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 1,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dates': dates?.toJson(),
      'page': page,
      'results': results.map((e) => e.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  @override
  List<Object?> get props => [dates, page, results, totalPages, totalResults];
}
