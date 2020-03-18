import 'dart:math';

import 'package:flutter/cupertino.dart';

class User {
  String id;
  String username;
  String password;
  String email;
  String name;
  String lastName;

  User(
      {this.id,
      this.username,
      this.password,
      this.email,
      this.name,
      this.lastName});

  User.fromMap(Map snapshot, String id)
      : id = id ?? '',
        username = snapshot['username'] ?? '',
        password = snapshot['password'] ?? '',
        email = snapshot['email'] ?? '',
        name = snapshot['email'] ?? '',
        lastName = snapshot['lastName'] ?? '';

  toJson() {
    return {
      "username": username,
      "password": password,
      "email": email,
      "name": name,
      "lastName": lastName
    };
  }
}
