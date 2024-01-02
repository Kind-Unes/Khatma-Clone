import 'package:flutter/material.dart';

class TextFieldModel extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  bool showClearButton = false;

  void updateText(String text) {
    showClearButton = text.isNotEmpty;
    notifyListeners();
  }

  void clearText() {
    controller.clear();
    showClearButton = false;
    notifyListeners();
  }
}