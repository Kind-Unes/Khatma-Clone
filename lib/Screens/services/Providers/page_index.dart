import 'package:flutter/material.dart';

class PageIndexProvider with ChangeNotifier {
  int _index = 4;

  int get index => _index;

  // This is correct, it's a getter
  set index(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}
