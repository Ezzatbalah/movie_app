// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app/features/home/data/model/recomended/recommended_movie.dart';
import 'package:movie_app/features/home/data/repo/home_repo_impl.dart';

part 'fetch_recommend_state.dart';

class FetchRecommendCubit extends Cubit<FetchRecommendState> {
  FetchRecommendCubit(this.homeRepoImpl) : super(FetchRecommendInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchNewRecommend() async {
    emit(FetchRecommendLoadind());
    var result = await homeRepoImpl.fetchRecommendedMovies();
    result.fold(
      (failure) {
        emit(FetchRecommendFailuer(failure.errorMassege));
      },
      (recommend) {
        emit(FetchRecommendSuccess(recommend));
      },
    );
  }
}
