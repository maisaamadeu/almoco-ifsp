import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  setIsSignedIn() {
    _isSignedIn = !_isSignedIn;
    notifyListeners();
  }
}
