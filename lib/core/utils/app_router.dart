import 'package:go_router/go_router.dart';
import 'package:movie_app/features/Navigator/presentation/view/navebar_view.dart';
import 'package:movie_app/features/home/presentation/view/home_details_view.dart';
import 'package:movie_app/features/home/presentation/view/home_view.dart';
import 'package:movie_app/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kAppbarView = '/appbarView';
  static const khomeView = '/homeView';
  static const khomeViewDetails = '/homeViewDetails';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kAppbarView,
        builder: (context, state) => const NavebarView(),
      ),
      GoRoute(path: khomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: khomeViewDetails,
        builder: (context, state) => const HomeDetailsView(),
      ),
    ],
  );
}
