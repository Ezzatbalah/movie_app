import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/features/search/data/repo/searchRepoImpl.dart';
import 'package:movie_app/features/search/presentation/manger/search/featch_search_cubit.dart';
import 'package:movie_app/features/search/presentation/view/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => FetchSearchCubit(getIt.get<searchRepoImpl>()),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
