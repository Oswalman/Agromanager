import 'package:flutter/material.dart';
import 'package:Agromanager/core/models/producto.dart';
import 'package:provider/provider.dart';
import 'package:Agromanager/core/viewmodels/ProductoCrud.dart';
import 'package:Agromanager/UI/Views/Home/Home.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';
import 'package:Agromanager/UI/Widgets/Appbar.dart';
import 'package:Agromanager/UI/Widgets/EndDrawer.dart';
import 'package:Agromanager/UI/Widgets/Fondo.dart';
import 'package:Agromanager/UI/Widgets/DrawerWidget.dart';

class NewEmpleados extends StatefulWidget {
  NewEmpleados(
      {Key key, this.auth, this.userId, this.logoutCallback, this.idTipoInsumo})
      : super(key: key);

  //---------------------------
  BaseAuth auth;
  VoidCallback logoutCallback;
  String userId;
  String idTipoInsumo;
  //---------------------------

  @override
  State<StatefulWidget> createState() => _NewEmpleadosState();
}

class _NewEmpleadosState extends State<NewEmpleados> {
  final _formKey = GlobalKey<FormState>();

  String idTipoInsumo;
  String nombre;
  DateTime fecha;
  String unidadMedida;
  double precioUnitario;
  int cantidad;
  String descripcion;

  @override
  void initState() {
    idTipoInsumo = widget.idTipoInsumo;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDProducto>(context);
    return Scaffold(
        appBar: AppbarWidget(title: "EMPLEADOS"),
        endDrawer: EndDrawer(context, widget.auth, widget.logoutCallback),
        drawer: DrawerWidget(
            context, widget.auth, widget.logoutCallback, widget.userId),
        body: Fondo(
            context,
            Padding(
              padding: EdgeInsets.all(12),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Align(
                      child: Text('Agregar',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              height: 1,
                              fontSize: 25)),
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nombre',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese nombre del nuevo insumo';
                          }
                        },
                        onSaved: (value) => nombre = value),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Fecha',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese descripcion';
                          }
                        },
                        onSaved: (value) => fecha = DateTime.parse(value)),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Unidad de medida',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese descripcion';
                          }
                        },
                        onSaved: (value) => unidadMedida = value),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Precio unitario',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese Precio unitario';
                          }
                        },
                        onSaved: (value) =>
                            precioUnitario = double.parse(value)),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Descripcion',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese descripcion';
                          }
                        },
                        onSaved: (value) => descripcion = value),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Cantidad',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese descripcion';
                          }
                        },
                        onSaved: (value) => cantidad = int.parse(value)),
                    SizedBox(
                      height: 16,
                      width: 200,
                    ),
                    SizedBox(
                      child: RaisedButton(
                        splashColor: Colors.red,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            await productProvider.addProducto(Producto(
                                nombre: nombre,
                                idTipoInsumo: idTipoInsumo,
                                fecha: fecha,
                                unidadMedida: unidadMedida,
                                precioUnitario: precioUnitario,
                                cantidad: cantidad,
                                descripcion: descripcion));
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Agregar',
                            style: TextStyle(color: Colors.white)),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
