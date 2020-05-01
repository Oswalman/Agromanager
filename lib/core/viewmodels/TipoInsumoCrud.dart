import '../services/api.dart';
import '../models/tipoInsumoModel.dart';
import '../../locator.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDTipoInsumo extends ChangeNotifier {
  Api _api = locator<Api>();

  List<TipoInsumo> tipoInsumo;


  Future<List<TipoInsumo>> fetchTipoInsumo() async {
    var result = await _api.getDataCollection();
    tipoInsumo = result.documents
        .map((doc) => TipoInsumo.fromMap(doc.data, doc.documentID))
        .toList();
    return tipoInsumo;
  }

  Stream<QuerySnapshot> fetchTipoInsumosAsStream() {
    return _api.streamDataCollection();
  }

  Future<TipoInsumo> getTipoInsumoById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  TipoInsumo.fromMap(doc.data, doc.documentID) ;
  }


  Future removeTipoInsumo(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateTipoInsumo(TipoInsumo data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addTipoInsumo(TipoInsumo data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}