import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_icon.dart';

class CustomMovieImage extends StatelessWidget {
  const CustomMovieImage({
    super.key,
    this.width,
    this.height,
    this.isPositioned = false,
    this.left = 16,
    this.bottom = -60,
  });
  final double? width;
  final double? height;
  final bool isPositioned;
  final double left;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Widget imageContent = Stack(
      children: [
        Image.asset(
          'assets/images/Image.png',
          width: width ?? screenWidth * 0.25,
          height: height,
        ),
        const Positioned(top: -3, left: 0, child: CustomIcon()),
      ],
    );

    if (isPositioned) {
      return Positioned(left: left, bottom: bottom, child: imageContent);
    }

    return imageContent;
  }
}
