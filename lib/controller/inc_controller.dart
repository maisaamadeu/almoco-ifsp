import 'package:flutter/material.dart';

class IncController extends ChangeNotifier {
  late bool _isSignedIn;
  bool get isSignedIn => _isSignedIn;
}
