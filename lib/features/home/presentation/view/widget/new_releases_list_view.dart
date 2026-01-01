import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/custom_circel_indcator.dart';
import 'package:movie_app/core/utils/custom_error_massege.dart';
import 'package:movie_app/core/utils/style.dart';
import 'package:movie_app/features/home/presentation/manger/fetc_New_releses/new_releses_cubit.dart';

import 'package:movie_app/features/home/presentation/view/widget/custom_movie_image.dart';

class NewReleasesListView extends StatelessWidget {
  const NewReleasesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<NewRelesesCubit, NewRelesesState>(
      builder: (context, state) {
        if (state is NewRelesesLoading) {
          return CustomCircularIndicator();
        } else if (state is NewRelesesFaulier) {
          return CustomErrorMassege(errorMassege: state.errorMessege);
        } else if (state is NewRelesesSuccess) {
          return Container(
            width: double.infinity,
            height: screenWidth * 0.5,
            color: Color(0xff282A28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 30),
                  child: Text(
                    'New Releases ',
                    style: Style.textStyle14.copyWith(fontSize: 15),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.newReles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            final movieId = state.newReles[index].id;
                            GoRouter.of(
                              context,
                            ).push(AppRouter.khomeViewDetails, extra: movieId);
                          },
                          child: CustomMovieImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${state.newReles[index].posterPath}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
