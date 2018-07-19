import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('CODA UFRO'),),
      body: new Center(
        child:  Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Image.asset('images/ufro.png',width: 150.0,height: 150.0,),
              new RaisedButton(
                elevation: (5.0),
                child: new Text("Log in"),
                onPressed: (){Navigator.pushNamed(context, '/Login');}
              )
            ],
          ),
        ),
      )
    );
  }
}