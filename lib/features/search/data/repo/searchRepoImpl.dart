import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuer.dart';
import 'package:movie_app/core/utils/api_services.dart';
import 'package:movie_app/features/search/data/model/search_response_model.dart';
import 'package:movie_app/features/search/data/repo/search_repo.dart';

class searchRepoImpl implements SearchRepo {
  final ApiServices apiServices;
  searchRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchSearch(String query) async {
    try {
      var data = await apiServices.search(
        endPoint: "search/movie",
        queryParameters: {'query': query},
      );
      final results = (data['results'] as List)
          .map((item) => MovieModel.fromJson(item))
          .toList();
      return Right(results);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }
}
