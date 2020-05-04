import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Api {
  final Firestore _db = Firestore.instance;
  CollectionReference ref;

  Future<QuerySnapshot> getDataCollection(String path) {
    return _db.collection(path).getDocuments();
  }

  Stream<QuerySnapshot> getDataSpecific(
      String path, String field, String valor) {
    return _db.collection(path).where(field, isEqualTo: valor).snapshots();
  }

  Stream<QuerySnapshot> streamDataCollection(String path) {
    return _db.collection(path).snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String path, String id) {
    return _db.collection(path).document(id).get();
  }

  Future<void> removeDocument(String path, String id) {
    return _db.collection(path).document(id).delete();
  }

  Future<DocumentReference> addDocument(String path, Map data) {
    return _db.collection(path).add(data);
  }

  Future<void> updateDocument(String path, Map data, String id) {
    return _db.collection(path).document(id).updateData(data);
  }
}
