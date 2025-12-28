import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/style.dart';

class CustomAppbarMovieDetailes extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarMovieDetailes({super.key, required this.title});
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, size: 34, color: Colors.white),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      title: Text(title, style: Style.textStyle14.copyWith(fontSize: 20)),
    );
  }
}
