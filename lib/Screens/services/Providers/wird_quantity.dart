import 'package:flutter/material.dart';

class WirdQuantityProvider with ChangeNotifier {
  int _currentIndex = 1; // juzz

  int get currentIndex => _currentIndex;

  void setQuantity(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
