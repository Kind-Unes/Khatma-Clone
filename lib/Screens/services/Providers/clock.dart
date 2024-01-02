import 'dart:async';

import 'package:flutter/material.dart';

class ClockProvider extends ChangeNotifier {
  late DateTime _currentTime;

  ClockProvider() {
    _updateTime();
    // Update the time every second
    Timer.periodic(const Duration(seconds: 1), (Timer timer) => _updateTime());
  }

  DateTime get currentTime => _currentTime;

  void _updateTime() {
    _currentTime = DateTime.now();
    notifyListeners();
  }
}
