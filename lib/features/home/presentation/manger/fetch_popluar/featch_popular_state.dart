part of 'featch_popular_cubit.dart';

sealed class FeatchPopularState extends Equatable {
  const FeatchPopularState();

  @override
  List<Object> get props => [];
}

final class FeatchPopularInitial extends FeatchPopularState {}

final class FeatchPopularLoading extends FeatchPopularState {}

final class FeatchPopularFailuer extends FeatchPopularState {
  final String errorMassege;
  const FeatchPopularFailuer(this.errorMassege);
}

final class FeatchPopularSuccess extends FeatchPopularState {
  final List<MovieResult> popluar;
  const FeatchPopularSuccess(this.popluar);
}
