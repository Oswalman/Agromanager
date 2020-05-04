import '../services/api.dart';
import '../models/producto.dart';
import '../../locator.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDProducto extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Producto> producto;

  Future<List<Producto>> fetchProducto() async {
    var result = await _api.getDataCollection('Productos');
    producto = result.documents
        .map((doc) => Producto.fromMap(doc.data, doc.documentID))
        .toList();
    return producto;
  }

  Stream<QuerySnapshot> fetchProductoAsStream() {
    return _api.streamDataCollection('Productos');
  }

  Stream<QuerySnapshot> fetchProductoWithCondition(String tipo) {
    return _api.getDataSpecific('Productos', "idTipoInsumo", tipo);
  }

  Future<Producto> getProductoById(String id) async {
    var doc = await _api.getDocumentById('Productos', id);
    return Producto.fromMap(doc.data, doc.documentID);
  }

  Future removeProducto(String id) async {
    await _api.removeDocument('Productos', id);
    return;
  }

  Future updateProducto(Producto data, String id) async {
    await _api.updateDocument('Productos', data.toJson(), id);
    return;
  }

  Future addProducto(Producto data) async {
    var result = await _api.addDocument('Productos', data.toJson());

    return;
  }
}
