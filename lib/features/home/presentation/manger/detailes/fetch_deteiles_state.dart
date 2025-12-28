part of 'fetch_deteiles_cubit.dart';

sealed class FetchDeteilesState extends Equatable {
  const FetchDeteilesState();

  @override
  List<Object> get props => [];
}

final class FetchDeteilesInitial extends FetchDeteilesState {}

final class FetchDeteilesLoading extends FetchDeteilesState {}

final class FetchDeteilesFailuer extends FetchDeteilesState {
  final String errorMassege;
  FetchDeteilesFailuer(this.errorMassege);
}

final class FetchDeteilesSuccess extends FetchDeteilesState {
  final List<Detailes> detail;
  FetchDeteilesSuccess(this.detail);
}
