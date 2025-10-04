import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_icon.dart';

class CustomMovieImage extends StatelessWidget {
  const CustomMovieImage({
    super.key,
    required this.imageUrl,
    this.isPositioned = false,
    this.width,
    this.height,
    this.left = 16,
    this.bottom = -60,
  });

  final String imageUrl;
  final bool isPositioned;
  final double? width;
  final double? height;
  final double left;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    final imageWidget = imageUrl.startsWith('http')
        ? Image.network(
            imageUrl,
            width: width ?? MediaQuery.of(context).size.width * 0.25,
            height: height,
            fit: BoxFit.cover,
          )
        : Image.asset(
            imageUrl,
            width: width ?? MediaQuery.of(context).size.width * 0.25,
            height: height,
            fit: BoxFit.cover,
          );

    final imageContent = Stack(
      children: [
        imageWidget,
        const Positioned(top: -3, left: 0, child: CustomIcon()),
      ],
    );

    return isPositioned
        ? Positioned(left: left, bottom: bottom, child: imageContent)
        : imageContent;
  }
}
