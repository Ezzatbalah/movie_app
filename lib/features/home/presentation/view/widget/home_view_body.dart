import 'package:flutter/material.dart';
import 'package:movie_app/features/browse/presentation/view/widget/new_releases_list_view.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_movie_image.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_text.dart';
import 'package:movie_app/features/home/presentation/view/widget/recommended_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    'assets/images/imagevid.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  const CustomMovieImage(),
                ],
              ),
              const CustomText(),
              const SizedBox(height: 30),
              const NewReleasesListView(),
              const SizedBox(height: 30),
              RecomendedListView(),
            ],
          ),
        ),
      ],
    );
  }
}
