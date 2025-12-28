import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/custom_circel_indcator.dart';
import 'package:movie_app/core/utils/custom_error_massege.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/features/home/presentation/manger/FetchRecommend/fetch_recommend_cubit.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_movie_image.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_rate.dart';

class RecomendedListView extends StatelessWidget {
  const RecomendedListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screanWidth = MediaQuery.of(context).size.height;
    return BlocBuilder<FetchRecommendCubit, FetchRecommendState>(
      builder: (context, state) {
        if (state is FetchRecommendLoadind) {
          return CustomCircularIndicator();
        } else if (state is FetchRecommendFailuer) {
          return CustomErrorMassege(errorMassege: state.errorMassege);
        } else if (state is FetchRecommendSuccess) {
          final recommend = state.recommend;
          return Container(
            width: double.infinity,
            height: screanWidth * 0.39,
            color: const Color(0xff282A28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 10),
                  child: Text(
                    'Recomended ',
                    style: Style.textStyle14.copyWith(fontSize: 15),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommend.length,
                    itemBuilder: (context, index) {
                      final movie = recommend[index];
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            final movieId = state.recommend[index].id;
                            GoRouter.of(
                              context,
                            ).push('/homeViewDetails/$movieId');
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomMovieImage(
                                imageUrl:
                                    'https://image.tmdb.org/t/p/w500${recommend[index].posterPath ?? ''}',
                              ),
                              CustomRate(
                                rate:
                                    movie.voteAverage?.toStringAsFixed(1) ??
                                    '0.0',
                              ),
                              const SizedBox(height: 4),
                              Text(
                                movie.title ?? 'Unknown',
                                style: Style.textStyle13,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                (movie.releaseDate != null &&
                                        movie.releaseDate!.isNotEmpty)
                                    ? movie.releaseDate!.split('-').first
                                    : 'N/A',
                                style: Style.textStyle13.copyWith(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
