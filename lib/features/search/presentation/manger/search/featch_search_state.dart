part of 'featch_search_cubit.dart';

sealed class FeatchSearchState extends Equatable {
  const FeatchSearchState();

  @override
  List<Object> get props => [];
}

final class FeatchSearchInitial extends FeatchSearchState {}

final class FeatchSearchLoading extends FeatchSearchState {}

final class FeatchSearchFauiler extends FeatchSearchState {
  final String errorMassege;
  const FeatchSearchFauiler(this.errorMassege);
}

final class FeatchSearchSucess extends FeatchSearchState {
  final List<MovieModel> searchSucces;
  const FeatchSearchSucess(this.searchSucces);
}
