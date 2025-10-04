import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/manger/fetch_popluar/featch_popular_cubit.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_carousel_slider.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_movie_image.dart';
import 'package:movie_app/features/home/presentation/view/widget/custom_text.dart';
import 'package:movie_app/features/home/presentation/view/widget/new_releases_list_view.dart';
import 'package:movie_app/features/home/presentation/view/widget/recommended_list_view.dart';
import 'package:movie_app/core/utils/custom_circel_indcator.dart';
import 'package:movie_app/core/utils/custom_error_massege.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatchPopularCubit, FeatchPopularState>(
      builder: (context, state) {
        if (state is FeatchPopularLoading) {
          return const CustomCircularIndicator();
        } else if (state is FeatchPopularFailuer) {
          return CustomErrorMassege(errorMassege: state.errorMassege);
        } else if (state is FeatchPopularSuccess) {
          final popular = state.popluar;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CustomCarouselSlider(
                          popular: popular,
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                        CustomMovieImage(
                          isPositioned: true,
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500${popular[currentIndex].posterPath}',
                        ),
                      ],
                    ),
                    CustomText(
                      title: popular[currentIndex].title ?? 'No title',
                      year: popular[currentIndex].releaseDate ?? '',
                    ),
                    const SizedBox(height: 30),
                    const NewReleasesListView(),
                    const SizedBox(height: 30),
                    const RecomendedListView(),
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
