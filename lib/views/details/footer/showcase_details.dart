import 'package:proyectoprograufro/modelo/ficha.dart';
import 'package:flutter/material.dart';

class DetailsShowcase extends StatelessWidget {
  final Ficha ficha;

  DetailsShowcase(this.ficha);

  @override
  Widget build(BuildContext context) {
    if(ficha.fonasa==true) {
      var textTheme = Theme
          .of(context)
          .textTheme;

      return new Center(
        child: new Text(
          "El Pasiente Posee Fonasa A",
          textAlign: TextAlign.center,
          style: textTheme.subhead.copyWith(color: Colors.white),
        ),
      );
    }else{
      var textTheme = Theme
          .of(context)
          .textTheme;

      return new Center(
        child: new Text(
          "El Pasiente Posee Isapre",
          textAlign: TextAlign.center,
          style: textTheme.subhead.copyWith(color: Colors.white),
        ),
      );
    }
  }
}
