import 'package:flutter/material.dart';
import 'package:movie_app/constant.dart';

class NavebarViewBody extends StatefulWidget {
  const NavebarViewBody({super.key});

  @override
  State<NavebarViewBody> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavebarViewBody> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Center(child: Text("Home")),
    const Center(child: Text("Search")),
    const Center(child: Text("Browser")),
    const Center(child: Text("Watchlist")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: kNaveBarColorSelected, // اللون لما يكون tab متعلم
        unselectedItemColor: kNaveBarColorUnSelected,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Browser"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Watchlist",
          ),
        ],
      ),
    );
  }
}
