import 'package:flutter/material.dart';

class WaishViewBody extends StatelessWidget {
  const WaishViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text('Watchlist', style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
