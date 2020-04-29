import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Agromanager/core/viewmodels/BaseAuth.dart';
import 'package:Agromanager/UI/Views/Login/Login.dart';

class Register extends StatefulWidget {
  Register({this.auth});
  final BaseAuth auth;


  @override
  State<StatefulWidget> createState() => new RegisterSign();
}

class RegisterSign extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading;
  String _email;
  String _password;
  String _errorMessage;
  bool _isLoginForm;

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        userId = await widget.auth.signUp(_email, _password);
        //widget.auth.sendEmailVerification();
        //_showVerifyEmailSentDialog();
        print('Signed up user: $userId');

        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

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
                  height: 100,
                  fit: BoxFit.cover,
                ),
                FlatButton(
                  onPressed: () {
                    final route = MaterialPageRoute(builder: (context) {
                      return Login();
                    });
                    Navigator.push(context, route);
                  },
                  child: Text('Atras'),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
                    child: Title(
                        color: Colors.black,
                        child: Text('Crear una cuenta nueva'))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_box, color: Colors.black),
                        hintText: 'Nombre',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'Nombre no puede estar vacio' : null,
                      onSaved: (value) => _email = value.trim(),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email, color: Colors.black),
                        hintText: 'Correo',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'Email no puede estar vacio' : null,
                      onSaved: (value) => _email = value.trim(),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                    child: TextFormField(
                        maxLines: 1,
                        autofocus: false,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock, color: Colors.black),
                          hintText: 'Contraseña',
                        ),
                        validator: (value) => value.isEmpty
                            ? 'La clave no puede estar vacia'
                            : null,
                        onSaved: (value) => _password = value.trim())),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                  child: SizedBox(
                    height: 40.0,
                    child: RaisedButton(
                      color: Color(0xff00A79B),
                      textColor: Colors.white,
                      onPressed: validateAndSubmit,
                      child: Text('CREAR CUENTA'),
                    ),
                  ),
                )
              ],
            )));
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 20.0,
              child: Center(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('AGROMANAGER'))))),
      body: Stack(
        children: <Widget>[showForm(), showCircularProgress()],
      ),
    );
  }
}
