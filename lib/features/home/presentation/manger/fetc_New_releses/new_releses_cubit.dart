// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/new_realeases/movie_new_releases_model.dart';
import 'package:movie_app/features/home/data/repo/home_repo_impl.dart';

part 'new_releses_state.dart';

class NewRelesesCubit extends Cubit<NewRelesesState> {
  final HomeRepoImpl homeRepoImpl;
  NewRelesesCubit(this.homeRepoImpl) : super(NewRelesesInitial());
  Future<void> fetchNewReleses() async {
    emit(NewRelesesLoading());
    var result = await homeRepoImpl.fetchNewRealeasesMovies();
    result.fold(
      (failure) {
        emit(NewRelesesFaulier(failure.errorMassege));
      },
      (newReles) {
        emit(NewRelesesSuccess(newReles));
      },
    );
  }
}
