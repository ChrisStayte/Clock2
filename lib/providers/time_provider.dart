import 'dart:async';

import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  DateTime _time = DateTime.now();
  DateTime get time => _time;

  TimeProvider() {
    // Update Time Every Second
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    _time = DateTime.now();
    notifyListeners();
  }
}
