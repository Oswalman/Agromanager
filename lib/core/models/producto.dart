class Producto {
  String id;
  String idTipoInsumo;
  String nombre;
  DateTime fecha;
  String unidadMedida;
  double precioUnitario;
  int cantidad;
  String descripcion;

  Producto(
      {this.id,
      this.idTipoInsumo,
      this.nombre,
      this.fecha,
      this.unidadMedida,
      this.precioUnitario,
      this.cantidad,
      this.descripcion});

  Producto.fromMap(Map snapshot, String id)
      : id = id ?? '',
        idTipoInsumo = snapshot['idTipoInsumo'] ?? '',
        nombre = snapshot['nombre'] ?? '',
        fecha = snapshot['fecha'] ?? '',
        unidadMedida = snapshot['unidadMedida'] ?? '',
        precioUnitario = snapshot['precioUnitario'] ?? '',
        cantidad = snapshot['cantidad'] ?? '',
        descripcion = snapshot['descripcion'] ?? '';

  toJson() {
    return {
      "idTipoInsumo": idTipoInsumo,
      "nombre": nombre,
      "fecha": fecha,
      "unidadMedida": unidadMedida,
      "precioUnitario": precioUnitario,
      "cantidad": cantidad,
      "descripcion": descripcion,
    };
  }
}
