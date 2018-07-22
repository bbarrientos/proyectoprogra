import 'package:flutter/material.dart';

import 'views/home.dart';
import 'views/perfil.dart';
import 'views/fichas.dart';
import 'views/nuevaFicha.dart';
import 'code/CustomRoute.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Coda UFRO',
      onGenerateRoute: (RouteSettings settings){
        switch(settings.name){
          case '/': return new CustomRoute(
            builder: (_) => new Home(),
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