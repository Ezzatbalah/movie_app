import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuer.dart';
import 'package:movie_app/core/utils/api_services.dart';
import 'package:movie_app/features/home/data/model/popular/movie_result.dart';
import 'package:movie_app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MovieResult>>> fetchPopularMovies() async {
    try {
      var data = await apiService.getPopular(endPoint: "movie/popular");
      final results = (data['results'] as List)
          .map((item) => MovieResult.fromJson(item))
          .toList();
      return Right(results);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }
}
