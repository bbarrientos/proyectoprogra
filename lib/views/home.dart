import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('CODA UFRO'),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                child: new Container(
                  child: const Text('CODA UFRO'),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Perfil'),
                onTap: (){
                  Navigator.pushNamed(context, '/Perfil');
                },
              ),
              new ListTile(
                leading: const Icon(Icons.insert_drive_file),
                title: const Text('Fichas'),
                onTap:(){
                  Navigator.pushNamed(context, '/Fichas');
                },
              ),
              new ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Ajustes'),
                onTap:(){
                  Navigator.pushNamed(context, '/Ajustes');
                },
              ),
            ],
          ),
        ),
      body: new Center(
        child:  Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Image.asset('images/ufro.png',width: 150.0,height: 150.0,),
            ],
          ),
        ),
      )
    );
  }
}