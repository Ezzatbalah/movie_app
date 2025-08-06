import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  const CustomTextFild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: const Color(0xFF514F4F),
        filled: true,
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.5)),
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
