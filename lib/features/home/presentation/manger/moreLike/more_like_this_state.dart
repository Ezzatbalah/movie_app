part of 'more_like_this_cubit.dart';

sealed class MoreLikeThisState extends Equatable {
  const MoreLikeThisState();

  @override
  List<Object> get props => [];
}

final class MoreLikeThisInitial extends MoreLikeThisState {}

final class MoreLikeThisLoading extends MoreLikeThisState {}

final class MoreLikeThisFailuer extends MoreLikeThisState {
  final String errorMassege;
  const MoreLikeThisFailuer(this.errorMassege);
}

final class MoreLikeThisSuccess extends MoreLikeThisState {
  final MoreLikeThisModel moreLikethis;
  const MoreLikeThisSuccess(this.moreLikethis);
}
