import 'package:flutter/material.dart';

class CustomBoxAction extends StatelessWidget {
  const CustomBoxAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11),
      child: Container(
        width: 65,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff514F4F)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(child: Text("Action")),
      ),
    );
  }
}
