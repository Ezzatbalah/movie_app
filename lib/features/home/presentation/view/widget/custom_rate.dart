import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/utils/style.dart';

class CustomRate extends StatelessWidget {
  const CustomRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 12,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 9),
        Text('7.7', style: Style.textStyle13),
      ],
    );
  }
}
