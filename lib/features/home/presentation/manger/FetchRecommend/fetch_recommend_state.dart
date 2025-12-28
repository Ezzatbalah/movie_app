part of 'fetch_recommend_cubit.dart';

sealed class FetchRecommendState extends Equatable {
  const FetchRecommendState();

  @override
  List<Object> get props => [];
}

final class FetchRecommendInitial extends FetchRecommendState {}

final class FetchRecommendLoadind extends FetchRecommendState {}

final class FetchRecommendFailuer extends FetchRecommendState {
  final String errorMassege;
  const FetchRecommendFailuer(this.errorMassege);
}

final class FetchRecommendSuccess extends FetchRecommendState {
  final List<RecommendedMovie> recommend;
  const FetchRecommendSuccess(this.recommend);
}
