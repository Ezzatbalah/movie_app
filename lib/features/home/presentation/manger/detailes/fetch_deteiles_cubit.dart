import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/model/detailes/detailes.dart';

part 'fetch_deteiles_state.dart';

class FetchDeteilesCubit extends Cubit<FetchDeteilesState> {
  FetchDeteilesCubit() : super(FetchDeteilesInitial());
}
