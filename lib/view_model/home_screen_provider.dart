import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/presentation/favorite_screen.dart';
import 'package:movie_app_tmdb/presentation/home_screen.dart';

class HomeProvider extends ChangeNotifier {
  List<Widget> pages = [HomeScreen(), FavoriteScreen()];
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite')
  ];

  void changeCurrentIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
