import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/features/home/data/repo/home_repo_impl.dart';
import 'package:movie_app/features/home/presentation/manger/fetch_popluar/featch_popular_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const Movies());
}

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeatchPopularCubit(getIt.get<HomeRepoImpl>())
                ..featchPopularMovie(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
