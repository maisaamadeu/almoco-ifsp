import 'package:flutter/material.dart';

class LoginPageController extends ChangeNotifier {
  late bool _isSignedIn;
  bool get isSignedIn => _isSignedIn;

  setIsSignedIn() {
    _isSignedIn = !_isSignedIn;
    notifyListeners();
  }
}
