import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final _formKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset(
          'assets/Fondo_Login.png',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.account_box, color: Colors.black),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nombre',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, escribe el nombre';
                      }
                      return null;
                    },
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.account_box, color: Colors.black),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Contraseña',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, escribe la contraseña';
                      }
                      return null;
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    // Valida si el form es correcto
                    //
                    if (_formKey.currentState.validate()) {
                      // Enviar al backend.
                    }
                  },
                  child: Text('INICIAR SESIÓN'),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
