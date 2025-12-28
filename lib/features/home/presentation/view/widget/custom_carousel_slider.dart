import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/features/home/data/model/popular/movie_result.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.popular,
    this.onPageChanged,
  });
  final List<MovieResult> popular;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          if (onPageChanged != null) onPageChanged!(index);
        },
        height: 200,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        viewportFraction: 1,
        enlargeCenterPage: true,
      ),
      items: popular.map((movie) {
        final imageUrl = movie.backdropPath != null
            ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
            : null;

        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.khomeViewDetails);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: imageUrl != null
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/imagevid.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  )
                : Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.movie, size: 60),
                  ),
          ),
        );
      }).toList(),
    );
  }
}
