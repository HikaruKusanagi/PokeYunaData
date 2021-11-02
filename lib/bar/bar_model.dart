import 'package:flutter/material.dart';

class BarModel extends ChangeNotifier {

  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  void onTabTapped(int index) async {
    _currentIndex = index;

    notifyListeners();
  }
}
