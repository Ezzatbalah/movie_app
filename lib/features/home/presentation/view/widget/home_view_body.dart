import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/features/browse/presentation/view/widget/new_releases_list_view.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_movie_image.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_text.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset('assets/images/imagevid.png', fit: BoxFit.cover),
            CustomMovieImage(),
          ],
        ),
        CustomText(),
        SizedBox(height: 30),
        NewReleasesListView(),
        SizedBox(height: 20),
      ],
    );
  }
}
