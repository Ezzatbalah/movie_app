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
      child: Icon(
        isSelected ? Icons.bookmark_added_rounded : Icons.add_box,
        color: isSelected ? Color(0xffF7B539) : Colors.grey,
      ),
    );
  }
}
