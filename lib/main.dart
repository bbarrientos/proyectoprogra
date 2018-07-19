import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/login.dart';
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
          case '/Login': return new CustomRoute(
            builder: (_) => new Login(),
            settings: settings,
          );
        }
        assert(false);
      }
    );
  }
}