// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/style.dart';

class CustomErrorMassege extends StatelessWidget {
  CustomErrorMassege({super.key, required this.errorMassege});
  String errorMassege;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMassege,
        style: Style.textStyle14,
        textAlign: TextAlign.center,
      ),
    );
  }
}
