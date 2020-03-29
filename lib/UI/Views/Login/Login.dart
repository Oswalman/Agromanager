import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final _formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginSign();
}

class LoginSign extends State<Login> {
  bool _isLoading = false;

  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showForm() {
    return Container(
        child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/Fondo_Login.png'),
                  width: 600,
                  height: 340,
                  fit: BoxFit.cover,
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_box, color: Colors.black),
                        hintText: 'Correo',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, escribe el nombre de usuario';
                        }
                        return null;
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock, color: Colors.black),
                        hintText: 'Contraseña',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, escribe la contraseña';
                        }
                        return null;
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                  child: SizedBox(
                    height: 40.0,
                    child: RaisedButton(
                      color: Color(0xff00A79B),
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
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 20.0,
              child: Row(
                children: <Widget>[
                  Center(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text('AGROMANAGER')))
                ],
              ))),
      body: Stack(
        children: <Widget>[showForm(), showCircularProgress()],
      ),
    );
  }
}
