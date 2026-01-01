import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/search/presentation/manger/search/featch_search_cubit.dart';

class CustomTextFild extends StatelessWidget {
  const CustomTextFild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) {
        context.read<FetchSearchCubit>().fetchSearch(query);
      },
      decoration: InputDecoration(
        fillColor: const Color(0xFF514F4F),
        filled: true,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          // ignore: deprecated_member_use
          borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
