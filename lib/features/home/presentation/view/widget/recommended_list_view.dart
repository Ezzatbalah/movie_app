import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_movie_image.dart';

class RecomendedListView extends StatelessWidget {
  const RecomendedListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screanWidth = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: screanWidth * 0.39,
      color: const Color(0xff282A28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 10),
            child: Text(
              'Recomended ',
              style: Style.textStyle14.copyWith(fontSize: 15),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomMovieImage(),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.solidStar,
                              size: 12,
                              color: Color(0xffFFDD4F),
                            ),
                            const SizedBox(width: 9),
                            Text('7.7', style: Style.textStyle10),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Deadpool 2',
                        style: Style.textStyle10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '2018  R  1h 59m',
                        style: Style.textStyle10.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
