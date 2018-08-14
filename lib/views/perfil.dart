import 'package:flutter/material.dart';
import 'package:proyectoprograufro/code/api.dart';
class Perfil extends StatelessWidget{
  CodaAPi _api;
  @override
  Widget build(BuildContext context){

    return new Scaffold(
      appBar: new AppBar(title: new Text('Perfil'),),
      body: new Center(
        child: Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                 // new Text(_api),
                ],
              ),
              new TextFormField(),
            ],
          ),
        ),
      )
    );
  }
}