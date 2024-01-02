import 'package:flutter/material.dart';

class AlertFiveProvider with ChangeNotifier {
  bool _vanish = false;

  bool get vanish => _vanish;

  // This is correct, it's a getter
  void setVanish(bool newVanish) {
    _vanish = newVanish;
    notifyListeners();
  }
}
