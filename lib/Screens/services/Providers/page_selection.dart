import 'package:flutter/material.dart';

class PageSelectionProvider with ChangeNotifier {
  bool _selectedpage = false;

  bool get selectedpage => _selectedpage;

  // This is correct, it's a getter
  set index(bool newIndex) {
    _selectedpage = newIndex;
    notifyListeners();
  }
}
