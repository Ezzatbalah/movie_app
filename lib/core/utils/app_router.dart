import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/Navigator/presentation/view/navebar_view.dart';
import 'package:movie_app/features/browse/presentation/view/browse_view.dart';
import 'package:movie_app/features/home/presentation/view/home_details_view.dart';
import 'package:movie_app/features/home/presentation/view/home_view.dart';
import 'package:movie_app/features/search/presentation/view/search_view.dart';
import 'package:movie_app/features/splash/presentation/view/splash_view.dart';
import 'package:movie_app/features/wishList/presentation/view/wish_view.dart';

abstract class AppRouter {
  static const kAppbarView = '/appbarView';
  static const khomeView = '/homeView';
  static const khomeViewDetails = '/homeViewDetails/:id';

  static const kSearch = '/search';
  static const kBrowse = '/browse';
  static const kWishList = '/wishList';
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
        builder: (context, state) {
          final movieId = state.extra as int;
          return HomeDetailsView(movieId: movieId);
        },
      ),
      GoRoute(path: kSearch, builder: (context, state) => const SearchView()),
      GoRoute(path: kBrowse, builder: (context, state) => const BrowseView()),
      GoRoute(path: kWishList, builder: (context, state) => const WishView()),
    ],
  );
}
