import 'package:flutter/material.dart';
import 'package:Agromanager/core/models/tipoInsumoModel.dart';
import 'package:provider/provider.dart';
import 'package:Agromanager/core/viewmodels/TipoInsumoCrud.dart';
import 'package:Agromanager/UI/Views/Home/Home.dart';

class AddInsumo extends StatefulWidget {
  @override
  _AddInsumoState createState() => _AddInsumoState();
}

class _AddInsumoState extends State<AddInsumo> {
  final _formKey = GlobalKey<FormState>();
  String nombre;
  String descripcion;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDTipoInsumo>(context);
    return HomePage.layout(Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Agregar tipo de insumo'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nombre',
                    fillColor: Colors.grey[300],
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Descripcion',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese descripcion';
                    }
                  },
                  onSaved: (value) => descripcion = value),
              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await productProvider.addTipoInsumo(
                        TipoInsumo(nombre: nombre, descripcion: descripcion));
                    Navigator.pop(context);
                  }
                },
                child: Text('Agregar', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
