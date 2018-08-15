import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyectoprograufro/code/conexion.dart';

class Verificacion extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<Verificacion> {
  final validacion_gf val = new validacion_gf();

  @override
  Widget build(BuildContext context) {
    final logininButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            val.signIn().then(
                (FirebaseUser user) => Navigator.pushNamed(context, '/home'));
          },
          color: Colors.lightBlueAccent,
          child: Text('Ingresar', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final loginoutButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade700,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            val.singOut();
            //Navigator.pushNamed(context, '/home');
          },
          color: Colors.redAccent,
          child: Text('Salir', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final background = Container(
      decoration: new BoxDecoration(
        image : new DecorationImage(
          image: new AssetImage("images/back.png")
        )
      ),
      child: null
    );

   /* final forgotLabel = FlatButton(
      child: Text(
        'Recuperar contraseña?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
    );
*/
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Center(
        child: ListView(
          
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            new Image.network("https://www.ufro.cl/joomlatools-files/docman-images/generated/c51ce410c124a10e0db5e4b97fc2af39.png"),
            /*logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),*/
            logininButton,
            loginoutButton,
            //forgotLabel,
            //new Image("images/back.png")
          ],
        ),
      ),
    );
  }
}
