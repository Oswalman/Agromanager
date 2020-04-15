import 'dart:math';

import 'package:flutter/cupertino.dart';

class User {
  String id;
  String password;
  String email;
  String name;
  String lastName;

  User(
      {this.id,
      this.password,
      this.email,
      this.name,
      this.lastName});

  User.fromMap(Map snapshot, String id)
      : id = id ?? '',
        password = snapshot['password'] ?? '',
        email = snapshot['email'] ?? '',
        name = snapshot['name'] ?? '',
        lastName = snapshot['lastName'] ?? '';

  toJson() {
    return {
      "password": password,
      "email": email,
      "name": name,
      "lastName": lastName
    };
  }
}
