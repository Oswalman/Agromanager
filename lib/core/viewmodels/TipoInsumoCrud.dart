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
    var result = await _api.getDataCollection('TipoInsumos');
    tipoInsumo = result.documents
        .map((doc) => TipoInsumo.fromMap(doc.data, doc.documentID))
        .toList();
    return tipoInsumo;
  }

  Stream<QuerySnapshot> fetchTipoInsumosAsStream() {
    return _api.streamDataCollection('TipoInsumos');
  }

  Future<TipoInsumo> getTipoInsumoById(String id) async {
    var doc = await _api.getDocumentById('TipoInsumos',id);
    return  TipoInsumo.fromMap(doc.data, doc.documentID) ;
  }


  Future removeTipoInsumo(String id) async{
     await _api.removeDocument('TipoInsumos',id) ;
     return ;
  }
  Future updateTipoInsumo(TipoInsumo data,String id) async{
    await _api.updateDocument('TipoInsumos',data.toJson(), id) ;
    return ;
  }

  Future addTipoInsumo(TipoInsumo data) async{
    var result  = await _api.addDocument('TipoInsumos',data.toJson()) ;

    return ;

  }


}