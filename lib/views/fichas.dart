import 'package:flutter/material.dart';

class Fichas extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text('Fichas'),),
      body: new Center(
        child: Container(
          padding: new EdgeInsets.all(32.0),
          child: new ListView(
            children: <Widget>[
              
            ],
            shrinkWrap: false,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){Navigator.pushNamed(context, '/NuevaFicha');},
      ),
    );
  }
}