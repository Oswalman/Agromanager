import 'dart:math';

import 'package:flutter/cupertino.dart';

class TipoInsumo {
  String id;
  String nombre;
  String descripcion;

  TipoInsumo(
      {this.id,
      this.nombre,
      this.descripcion});

  TipoInsumo.fromMap(Map snapshot, String id)
      : id = id ?? '',
        nombre = snapshot['nombre'] ?? '',
        descripcion = snapshot['descripcion'] ?? '';


  toJson() {
    return {
      "nombre": nombre,
      "descripcion": descripcion,
    };
  }
}
