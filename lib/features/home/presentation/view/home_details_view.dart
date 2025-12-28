import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/features/home/data/repo/home_repo_impl.dart';
import 'package:movie_app/features/home/presentation/manger/detailes/fetch_deteiles_cubit.dart';
import 'package:movie_app/features/home/presentation/view/widget/home_details_view_body.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            FetchDeteilesCubit(getIt.get<HomeRepoImpl>())
              ..fetchDetails(movieId),
        child: HomeDetailsViewBody(movieId: movieId),
      ),
    );
  }
}
