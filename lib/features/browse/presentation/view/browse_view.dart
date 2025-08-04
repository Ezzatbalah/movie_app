import 'package:flutter/material.dart';
import 'package:movie_app/features/browse/presentation/view/widget/browse_view_body.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BrowseViewBody());
  }
}
