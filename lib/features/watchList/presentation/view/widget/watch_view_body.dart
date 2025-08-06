import 'package:flutter/material.dart';

class WatchListViewBody extends StatelessWidget {
  const WatchListViewBody({super.key});

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
