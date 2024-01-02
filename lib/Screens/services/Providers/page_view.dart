import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  double _currentPage = 0.0;

  double get currentPage => _currentPage;

  void setCurrentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }
}
