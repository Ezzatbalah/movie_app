import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/search/presentation/manger/search/featch_search_cubit.dart';
import 'package:movie_app/features/search/presentation/view/widget/customTextFild.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFild(),
            SizedBox(height: 16),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<FetchSearchCubit, FeatchSearchState>(
                builder: (context, state) {
                  if (state is FeatchSearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FeatchSearchFauiler) {
                    return Center(child: Text(state.errorMassege));
                  } else if (state is FeatchSearchSucess) {
                    final movies = state.searchSucces;
                    return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: movie.posterPath != null
                                ? Image.network(
                                    "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                                    width: 50,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    width: 50,
                                    color: Colors.grey,
                                    child: const Icon(Icons.movie),
                                  ),
                            title: Text(movie.title),
                            subtitle: Text(movie.releaseDate ?? ''),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
