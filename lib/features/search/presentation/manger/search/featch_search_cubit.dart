// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/search/data/model/search_response_model.dart';
import 'package:movie_app/features/search/data/repo/searchRepoImpl.dart';

part 'featch_search_state.dart';

class FetchSearchCubit extends Cubit<FeatchSearchState> {
  FetchSearchCubit(this.searchrepoimpl) : super(FeatchSearchInitial());
  final searchRepoImpl searchrepoimpl;
  Future<void> fetchSearch(String query) async {
    emit(FeatchSearchLoading());
    var result = await searchrepoimpl.fetchSearch(query);
    result.fold(
      (failure) {
        emit(FeatchSearchFauiler(failure.errorMassege));
      },
      (detail) {
        emit(FeatchSearchSucess(detail));
      },
    );
  }
}
