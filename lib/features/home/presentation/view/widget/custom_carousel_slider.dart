import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.khomeViewDetails);
      },
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          viewportFraction: 1,
        ),
        items:
            [
              'assets/images/imagevid.png',
              'assets/images/Image.png',
              'assets/images/imagevid.png',
            ].map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              );
            }).toList(),
      ),
    );
  }
}
