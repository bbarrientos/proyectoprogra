import 'package:proyectoprograufro/modelo/ficha.dart';
import 'package:flutter/material.dart';

class DetailsShowcase extends StatelessWidget {
  final Ficha ficha;

  DetailsShowcase(this.ficha);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Center(
      child: new Text(
        ficha.direccion,
        textAlign: TextAlign.center,
        style: textTheme.subhead.copyWith(color: Colors.white),
      ),
    );
  }
}
