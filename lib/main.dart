import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'CODA UFRO',
      routes: <String,WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
        '/Login': (BuildContext context) => new Login(),
      },
      home: new Home(),
    );
  }
}