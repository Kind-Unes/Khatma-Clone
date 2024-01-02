import 'package:flutter/material.dart';

class BookMarkProivder with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  // This is correct, it's a getter
  set index(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}
