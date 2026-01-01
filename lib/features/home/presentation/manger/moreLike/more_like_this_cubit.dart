import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/similar/similar.dart';
import 'package:movie_app/features/home/data/repo/home_repo_impl.dart';

part 'more_like_this_state.dart';

class MoreLikeThisCubit extends Cubit<MoreLikeThisState> {
  MoreLikeThisCubit(this.homeRepoImpl) : super(MoreLikeThisInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchMoerLikeThis(int movieId) async {
    emit(MoreLikeThisLoading());
    var result = await homeRepoImpl.fetchMoreLikeThis(movieId);
    result.fold(
      (failure) {
        emit(MoreLikeThisFailuer(failure.errorMassege));
      },
      (movies) {
        emit(MoreLikeThisSuccess(movies));
      },
    );
  }
}
