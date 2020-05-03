import '../services/api.dart';
import '../models/userModel.dart';
import '../../locator.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<User> users;

  Future<List<User>> fetchUsers() async {
    var result = await _api.getDataCollection('Usuarios');
    users = result.documents
        .map((doc) => User.fromMap(doc.data, doc.documentID))
        .toList();
    return users;
  }

  Stream<QuerySnapshot> fetchUsersAsStream() {
    return _api.streamDataCollection('Usuarios');
  }

  Future<User> getUserById(String id) async {
    var doc = await _api.getDocumentById('Usuarios', id);
    return User.fromMap(doc.data, doc.documentID);
  }

  Future removeUser(String id) async {
    await _api.removeDocument('Usuarios', id);
    return;
  }

  Future updateUser(User data, String id) async {
    await _api.updateDocument('Usuarios', data.toJson(), id);
    return;
  }

  Future addUser(User data) async {
    var result = await _api.addDocument('Usuarios', data.toJson());

    return;
  }
}
