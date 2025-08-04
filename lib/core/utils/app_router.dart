import 'package:go_router/go_router.dart';
import 'package:movie_app/features/Navigator/view/appbar_view.dart';
import 'package:movie_app/features/splash/view/splash_view.dart';

abstract class AppRouter {
  static const KappbarView = '/appbarView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: KappbarView,
        builder: (context, state) => const AppbarView(),
      ),
    ],
  );
}
