import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/features/home/data/model/similar/similar.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_movie_image.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_rate.dart';

class MoreLikeThisListView extends StatelessWidget {
  const MoreLikeThisListView({super.key, required this.movies});
  final List<MoreLikeThisModel> movies;

  @override
  Widget build(BuildContext context) {
    final screanWidth = MediaQuery.of(context).size.height;
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
              'More Like This ',
              style: Style.textStyle14.copyWith(fontSize: 15),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push(AppRouter.khomeViewDetails, extra: movie.id);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomMovieImage(
                          imageUrl: movie.posterPath != null
                              ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                              : 'assets/images/Image.png',
                        ),

                        Expanded(
                          child: CustomRate(
                            rate: movie.voteAverage.toStringAsFixed(1),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          movie.title ?? 'Unknown Title',
                          style: Style.textStyle13,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          movie.releaseDate?.split('-').first ?? 'N/A',
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
}
