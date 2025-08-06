import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  const CustomIcon({super.key});

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Image.asset(
        isSelected
            ? 'assets/images/bookmark.png'
            : 'assets/images/Icon awesome-bookmark.png',
        width: 28,
        height: 28,
      ),
    );
  }
}
