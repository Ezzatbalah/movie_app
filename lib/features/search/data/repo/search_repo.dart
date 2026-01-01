import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuer.dart';
import 'package:movie_app/features/search/data/model/search_response_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieModel>>> fetchSearch(String query);
}
