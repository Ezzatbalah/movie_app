import 'package:go_router/go_router.dart';
import 'package:movie_app/features/Navigator/view/navebar_view.dart';
import 'package:movie_app/features/splash/view/splash_view.dart';

abstract class AppRouter {
  static const kAppbarView = '/appbarView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kAppbarView,
        builder: (context, state) => const NavebarView(),
      ),
    ],
  );
}
