
import 'package:flutter/material.dart';
import 'package:proyectoprograufro/views/home.dart';

import 'package:firebase_auth/firebase_auth.dart';
/*import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';*/
import 'package:proyectoprograufro/code/conexion.dart';

class Verificacion extends StatefulWidget {
  static String tag = 'login-page';
  //final validacion_gf val = new validacion_gf();
  @override
  _LoginPageState createState() => new _LoginPageState();
  Home home() => new Home();
}

class _LoginPageState extends State<Verificacion> {
  final validacion_gf val = new validacion_gf();



  @override
  Widget build(BuildContext context) {
/*
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/ufro.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'b.barrientos01@ufromail.cl',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
*/

    final logininButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            val.signIn().then((FirebaseUser user)=> print(user)).catchError((e)=>print(e));
            //Navigator.pushNamed(context, '/home');
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
          onPressed: (){
            val.singOut();
            //Navigator.pushNamed(context, '/home');
          },
          color: Colors.redAccent,
          child: Text('Salir', style: TextStyle(color: Colors.white)),
        ),
      ),
    );



    final forgotLabel = FlatButton(
      child: Text(
        'Recuperar contraseña?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            /*logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),*/
            logininButton,
            loginoutButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}