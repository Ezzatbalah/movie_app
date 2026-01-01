import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/custom_circel_indcator.dart';
import 'package:movie_app/core/utils/custom_error_massege.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/features/home/presentation/manger/detailes/fetch_deteiles_cubit.dart';
import 'package:movie_app/features/home/presentation/manger/moreLike/more_like_this_cubit.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_appbar_detailes.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_image_detailes.dart';
import 'package:movie_app/features/home/presentation/view/widget/more_like_this_list_view.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<FetchDeteilesCubit, FetchDeteilesState>(
      builder: (context, state) {
        if (state is FetchDeteilesLoading) {
          return CustomCircularIndicator();
        } else if (state is FetchDeteilesFailuer) {
          return CustomErrorMassege(errorMassege: state.errorMassege);
        } else if (state is FetchDeteilesSuccess) {
          final movie = state.detail;
          return Scaffold(
            appBar: CustomAppbarMovieDetailes(
              title: movie.title ?? 'Unknown Title',
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      movie.posterPath != null
                          ? Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                              height: screenHight * 0.30,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: screenHight * 0.30,
                              color: Colors.grey,
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, top: 13),
                        child: Text(
                          movie.title ?? 'Unknown Title',
                          style: Style.textStyle14.copyWith(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, top: 8),
                        child: Text(
                          '${movie.releaseDate?.split('-').first ?? 'N/A'}  ${movie.status ?? ''}  ${movie.runtime ?? 0}m',
                          style: Style.textStyle10,
                        ),
                      ),
                      CustomImageDetailes(
                        screenWidth: screenWidth,
                        movie: movie,
                      ),
                      BlocBuilder<MoreLikeThisCubit, MoreLikeThisState>(
                        builder: (context, state) {
                          if (state is MoreLikeThisLoading) {
                            return CustomCircularIndicator();
                          } else if (state is MoreLikeThisFailuer) {
                            return CustomErrorMassege(
                              errorMassege: state.errorMassege,
                            );
                          } else if (state is MoreLikeThisSuccess) {
                            return MoreLikeThisListView(
                              movies: state.moreLikethis,
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
