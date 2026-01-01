import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuer.dart';
import 'package:movie_app/core/utils/api_services.dart';
import 'package:movie_app/features/home/data/model/detailes/detailes.dart';
import 'package:movie_app/features/home/data/model/new_realeases/movie_new_releases_model.dart';
import 'package:movie_app/features/home/data/model/popular/movie_result.dart';

import 'package:movie_app/features/home/data/model/recomended/recommended_movie.dart';
import 'package:movie_app/features/home/data/model/similar/similar.dart';

import 'package:movie_app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MovieResult>>> fetchPopularMovies() async {
    try {
      var data = await apiService.getMovie(endPoint: "movie/popular");
      final results = (data['results'] as List)
          .map((item) => MovieResult.fromJson(item))
          .toList();
      return Right(results);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieNewReleasesModel>>>
  fetchNewRealeasesMovies() async {
    try {
      var data = await apiService.getMovie(endPoint: "movie/upcoming");
      final results = (data['results'] as List)
          .map((item) => MovieNewReleasesModel.fromJson(item))
          .toList();

      return Right(results);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecommendedMovie>>>
  fetchRecommendedMovies() async {
    try {
      var data = await apiService.getMovie(endPoint: "movie/top_rated");
      final results = (data['results'] as List)
          .map((item) => RecommendedMovie.fromJson(item))
          .toList();

      return Right(results);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Detailes>> fetchDetailsMovies(int movieId) async {
    try {
      var data = await apiService.getMovie(endPoint: "movie/$movieId");
      final detail = Detailes.fromJson(data);
      return Right(detail);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoreLikeThisModel>>> fetchMoreLikeThis(
    int movieId,
  ) async {
    try {
      var data = await apiService.getMovie(endPoint: "movie/$movieId/similar");
      final results = (data['results'] as List)
          .map((item) => MoreLikeThisModel.fromJson(item))
          .toList();

      return Right(results);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }
}
