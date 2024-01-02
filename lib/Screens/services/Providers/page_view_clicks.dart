import 'package:flutter/material.dart';

class ClickCounterProvider with ChangeNotifier {
  int _clickCount = 0;

  int get clickCount => _clickCount;

  void incrementClickCount() {
    _clickCount++;

    notifyListeners();
  }

  void setClickCount(int index) {
    _clickCount = index;

    notifyListeners();
  }
}
