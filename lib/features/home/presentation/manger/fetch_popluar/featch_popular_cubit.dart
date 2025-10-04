// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/popular/movie_result.dart';
import 'package:movie_app/features/home/data/repo/home_repo_impl.dart';

part 'featch_popular_state.dart';

class FeatchPopularCubit extends Cubit<FeatchPopularState> {
  FeatchPopularCubit(this.homeRepoImpl) : super(FeatchPopularInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> featchPopularMovie() async {
    emit(FeatchPopularLoading());
    var result = await homeRepoImpl.fetchPopularMovies();
    result.fold(
      (failure) {
        emit(FeatchPopularFailuer(failure.errorMassege));
      },
      (popluar) {
        emit(FeatchPopularSuccess(popluar));
      },
    );
  }
}
