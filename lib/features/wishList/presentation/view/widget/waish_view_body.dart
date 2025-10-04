import 'package:flutter/material.dart';

class WaishViewBody extends StatelessWidget {
  const WaishViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Watchlist', style: TextStyle(fontSize: 22))],
        ),
      ),
    );
  }
}
