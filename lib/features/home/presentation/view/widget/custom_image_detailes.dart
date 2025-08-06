import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_box_action.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_movie_image.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_rate.dart';

class CustomImageDetailes extends StatelessWidget {
  const CustomImageDetailes({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomMovieImage(width: screenWidth * 0.34),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: CustomBoxAction()),
                      Expanded(child: CustomBoxAction()),
                      Expanded(child: CustomBoxAction()),
                    ],
                  ),
                ),
                SizedBox(height: 3),
                CustomBoxAction(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school',
                    style: Style.textStyle13.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomRate(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
