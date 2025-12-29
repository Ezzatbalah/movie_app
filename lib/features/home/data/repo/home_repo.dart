import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuer.dart';
import 'package:movie_app/features/home/data/model/detailes/detailes.dart';
import 'package:movie_app/features/home/data/model/new_realeases/movie_new_releases_model.dart';
import 'package:movie_app/features/home/data/model/popular/movie_result.dart';

import 'package:movie_app/features/home/data/model/recomended/recommended_movie.dart';
import 'package:movie_app/features/home/data/model/similar/similar.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieResult>>> fetchPopularMovies();
  Future<Either<Failure, List<MovieNewReleasesModel>>>
  fetchNewRealeasesMovies();
  Future<Either<Failure, List<RecommendedMovie>>> fetchRecommendedMovies();
  Future<Either<Failure, Detailes>> fetchDetailsMovies(int movieId);
  Future<Either<Failure, MoreLikeThisModel>> fetchMoreLikeThis(int movieId);
}
