import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/style.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80, top: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Dora and the Lost City of Gold', style: Style.textStyle14),
          SizedBox(height: 4),
          Text('2019  PG-13  2h 7m', style: Style.textStyle10),
        ],
      ),
    );
  }
}
