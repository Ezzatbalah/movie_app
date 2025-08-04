import 'package:flutter/material.dart';
import 'package:movie_app/features/watchList/presentation/view/widget/watch_view_body.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WatchListViewBody());
  }
}
