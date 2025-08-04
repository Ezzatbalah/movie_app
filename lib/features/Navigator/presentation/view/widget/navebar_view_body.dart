import 'package:flutter/material.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/features/browse/presentation/view/browse_view.dart';
import 'package:movie_app/features/home/presentation/view/home_view.dart';
import 'package:movie_app/features/search/presentation/view/search_view.dart';
import 'package:movie_app/features/watchList/presentation/view/watch_view.dart';

class NavebarViewBody extends StatefulWidget {
  const NavebarViewBody({super.key});

  @override
  State<NavebarViewBody> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavebarViewBody> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const SearchView(),
    const BrowseView(),
    const WatchListView(),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie, size: 30),
            label: "Browser",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, size: 30),
            label: "Watchlist",
          ),
        ],
      ),
    );
  }
}
