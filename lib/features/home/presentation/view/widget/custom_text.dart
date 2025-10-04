import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/style.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title, required this.year});
  final String title;
  final String year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80, top: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Style.textStyle14),
          SizedBox(height: 4),
          Text(year, style: Style.textStyle10),
        ],
      ),
    );
  }
}
