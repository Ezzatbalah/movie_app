import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/features/home/data/repo/home_repo_impl.dart';
import 'package:movie_app/features/home/presentation/manger/detailes/fetch_deteiles_cubit.dart';
import 'package:movie_app/features/home/presentation/manger/moreLike/more_like_this_cubit.dart';
import 'package:movie_app/features/home/presentation/view/widget/home_details_view_body.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              FetchDeteilesCubit(getIt.get<HomeRepoImpl>())
                ..fetchDetails(movieId),
        ),

        BlocProvider(
          create: (_) =>
              MoreLikeThisCubit(getIt.get<HomeRepoImpl>())
                ..fetchMoerLikeThis(movieId),
        ),
      ],
      child: Scaffold(body: HomeDetailsViewBody(movieId: movieId)),
    );
  }
}
