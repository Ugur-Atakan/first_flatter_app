import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? username;
  String? password;
  void changeUser(String? username, String? password) {
    this.username = username;
    this.password = password;
    notifyListeners();
  }
}
