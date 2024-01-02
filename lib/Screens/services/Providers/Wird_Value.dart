// ignore: file_names
import 'package:flutter/material.dart';

class WirdValueProvider with ChangeNotifier {
  // hizb
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setStart(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}


// it uses the juzz_page dataset