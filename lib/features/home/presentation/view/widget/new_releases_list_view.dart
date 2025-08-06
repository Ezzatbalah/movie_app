import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_movie_image.dart';

class NewReleasesListView extends StatelessWidget {
  const NewReleasesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenWidth * 0.5,
      color: Color(0xff282A28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 10),
            child: Text(
              'New Releases ',
              style: Style.textStyle14.copyWith(fontSize: 15),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.khomeViewDetails);
                    },
                    child: CustomMovieImage(),
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
