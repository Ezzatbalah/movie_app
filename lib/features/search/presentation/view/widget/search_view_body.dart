import 'package:flutter/material.dart';
import 'package:movie_app/features/search/presentation/view/widget/customTextFild.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [CustomTextFild(), SizedBox(height: 16)],
        ),
      ),
    );
  }
}
