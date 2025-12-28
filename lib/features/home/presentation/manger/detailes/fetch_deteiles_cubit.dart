// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/detailes/detailes.dart';
import 'package:movie_app/features/home/data/repo/home_repo_impl.dart';

part 'fetch_deteiles_state.dart';

class FetchDeteilesCubit extends Cubit<FetchDeteilesState> {
  final HomeRepoImpl homeRepoImpl;
  FetchDeteilesCubit(this.homeRepoImpl) : super(FetchDeteilesInitial());
  Future<void> fetchDetails(int movieId) async {
    emit(FetchDeteilesLoading());
    var result = await homeRepoImpl.fetchDetailsMovies(movieId);
    result.fold(
      (failure) {
        emit(FetchDeteilesFailuer(failure.errorMassege));
      },
      (detail) {
        emit(FetchDeteilesSuccess(detail));
      },
    );
  }
}
