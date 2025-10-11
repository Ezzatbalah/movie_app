part of 'new_releses_cubit.dart';

sealed class NewRelesesState extends Equatable {
  const NewRelesesState();

  @override
  List<Object> get props => [];
}

final class NewRelesesInitial extends NewRelesesState {}

final class NewRelesesLoading extends NewRelesesState {}

final class NewRelesesFaulier extends NewRelesesState {
  final String errorMessege;
  const NewRelesesFaulier(this.errorMessege);
}

final class NewRelesesSuccess extends NewRelesesState {
  final List<MovieNewReleasesModel> newReles;
  const NewRelesesSuccess(this.newReles);
}
