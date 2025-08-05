import 'package:flutter/material.dart';

class CustomMovieImage extends StatelessWidget {
  const CustomMovieImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: -60,
      left: 16,
      child: Stack(
        children: [
          Image.asset('assets/images/Image.png', width: screenWidth * 0.25),
          const Positioned(
            top: 4,
            left: 4,
            child: Icon(Icons.add_box, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
