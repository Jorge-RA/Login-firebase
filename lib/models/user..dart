// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class User {
  Map<String, String> userForm = {
    'email': '',
    'password': '',
    'returnSecureToken': 'true',
  };
  String? email;
  String? password;
  String returnSecureToken = 'true';

  User({this.email, this.password, this.returnSecureToken = 'true'});

  User.formAuth(Map<String, String> userForm) {
    this.userForm['email'] = userForm['email'] ?? '';
    this.userForm['password'] = userForm['password'] ?? '';
    this.email = userForm['email'] ?? '';
    this.password = userForm['password'] ?? '';
  }
}
