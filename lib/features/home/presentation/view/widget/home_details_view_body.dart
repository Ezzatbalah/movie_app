import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_appbar_detailes.dart';

import 'package:movie_app/features/home/presentation/view/widget/custom_image_detailes.dart';
import 'package:movie_app/features/home/presentation/view/widget/more_like_this_list_view.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppbarMovieDetailes(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/imagevid.png',

                  height: screenHight * 0.30,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 13),
                  child: Text(
                    'Dora and the lost city of gold',
                    style: Style.textStyle14.copyWith(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 8),
                  child: Text('2019  PG-13  2h 7m', style: Style.textStyle10),
                ),

                CustomImageDetailes(screenWidth: screenWidth),
                MoreLikeThisListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
