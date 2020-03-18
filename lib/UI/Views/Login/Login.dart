import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final _formKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          Align(alignment: Alignment.bottomCenter, child: Text('AGROMANAGER')),
      body: Column(children: [
        Image(
          image: AssetImage('assets/Fondo_Login.png'),
          width: 600,
          height: 340,
          fit: BoxFit.cover,
        ),
        Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Icon(Icons.account_box, color: Colors.black)),
                    Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Nombre',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, escribe el nombre';
                        }
                        return null;
                      },
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Icon(Icons.lock, color: Colors.black)),
                    Expanded(
                        child: TextFormField(
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
                    ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
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
            ))
      ]),
    );
  }
}
