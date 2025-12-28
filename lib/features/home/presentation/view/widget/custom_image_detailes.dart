import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/features/home/data/model/detailes/detailes.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_box_action.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_movie_image.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_rate.dart';

class CustomImageDetailes extends StatelessWidget {
  const CustomImageDetailes({
    super.key,
    required this.screenWidth,
    required this.movie,
  });

  final double screenWidth;
  final Detailes movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomMovieImage(
            imageUrl: movie.posterPath != null
                ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                : 'assets/images/Image.png',
            width: screenWidth * 0.34,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomBoxAction(
                          label: movie.voteAverage?.toStringAsFixed(1) ?? '0.0',
                        ),
                      ),
                      Expanded(
                        child: CustomBoxAction(label: movie.status ?? 'N/A'),
                      ),
                      Expanded(
                        child: CustomBoxAction(label: '${movie.runtime ?? 0}m'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3),
                CustomBoxAction(label: 'Action'),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie.overview ?? 'No description available',
                    style: Style.textStyle13.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomRate(
                    rate: movie.voteAverage != null
                        ? movie.voteAverage!.toStringAsFixed(1)
                        : '0.0',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
