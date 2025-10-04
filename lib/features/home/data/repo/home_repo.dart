import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuer.dart';
import 'package:movie_app/features/home/data/model/popular/movie_result.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieResult>>> fetchPopularMovies();
  // Future <Either<Failure,List<MovieResult>>>fetchNewRealeasesMovies();
  //  Future <Either<Failure,List<MovieResult>>>fetchRecommendedMovies();
}
