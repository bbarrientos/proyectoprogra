import 'package:flutter/material.dart';

import 'views/log_In.dart';
import 'views/perfil.dart';
import 'views/fichas.dart';
import 'views/nuevaFicha.dart';
import 'code/CustomRoute.dart';
import 'views/homePrincipal.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.blueAccent,
        accentColor: Colors.amber,
        fontFamily: 'SlateForOnePlus'


      ),
      title: 'Coda UFRO',
      onGenerateRoute: (RouteSettings settings){
        switch(settings.name){
          case '/': return new CustomRoute(
            builder: (_) => new Verificacion(),
            settings: settings,
          );
          case '/home': return new CustomRoute(
            builder: (_) => new FichaList(),
            settings: settings,
          );
          case '/Perfil': return new CustomRoute(
            builder: (_) => new Perfil(),
            settings: settings,
          );
          case '/Fichas': return new CustomRoute(
            builder: (_) => new Fichas(),
            settings: settings,
          );
          case '/NuevaFicha': return new CustomRoute(
            builder: (_) => new NuevaFicha(),
            settings: settings,
          );
        }
        assert(false);
      }
    );
  }
}