import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  String _userEmail = '';
  String _userPassword = '';
  String _userName = '';


  String get userEmail => _userEmail;

  set userEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }

  String get userPassword => _userPassword;

  set userPassword(String value) {
    _userPassword = value;
    notifyListeners();
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }
}