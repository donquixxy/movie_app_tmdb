import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
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
