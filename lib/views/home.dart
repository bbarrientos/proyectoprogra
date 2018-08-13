import 'package:flutter/material.dart';
import 'package:proyectoprograufro/code/ficha.dart';
import 'package:proyectoprograufro/code/conexion.dart';
class Home extends StatelessWidget{
  final MostrarFichas mostrarDatosLista = new MostrarFichas();
  final validacion_gf val = new validacion_gf();


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
              new ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Desconectarse'),
                onTap:(){
                  val.singOut();
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          ),
        ),


      body: mostrarDatosLista,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){Navigator.pushNamed(context, '/Fichas');},
        )
      /*Center(
        child:  Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Image.asset('images/ufro.png',width: 150.0,height: 150.0,),
            ],
          ),
        ),
      )*/
    );
  }
}

