import 'package:proyectoprograufro/modelo/ficha.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final dynamic fichatributeLookup = {
  "children": {"name": "Kid Friendly", "icon": FontAwesomeIcons.child},
  "desexed": {"name": "Desexed", "icon": FontAwesomeIcons.cut},
  "vaccinated": {"name": "Vaccinated", "icon": FontAwesomeIcons.eyeDropper},
  "microchipped": {"name": "Microchipped", "icon": FontAwesomeIcons.microchip},
};

class FichatributesShowcase extends StatelessWidget {
  final Ficha ficha;

  FichatributesShowcase(this.ficha);

  @override
  Widget build(BuildContext context) {
    print(ficha.telefono);
    if(ficha.telefono == 56926235689){
      return new Container(
        child: new Center(
          child: new Text(
            "LaPediatría Sociales un término que se utiliza para describir la importancia de atendera  los  niños  de  una  manera  que  contemple  el  contexto  social  en  el  que  viven",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
              color: Colors.amberAccent,
            ),
          ),
        ),
        //new Text("HOla3"),
      );
    }else if(ficha.telefono== 56956891236){
      return new Container(
        child: new Center(
          child: new Text(
            "futuro  de  la  salud  infantil  y  de  la  pediatría  –  asistencia  sanitaria  a  la  infancia  fueobjeto  de  un  análisis  prospectivo  Delphi  publicado  en  2002  con  la  participación  de  263 en el que se analizaron la demografía y los problemas de salud emergentes; laestructura  y  la  especificidad  de  la  pediatría",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
              color: Colors.amberAccent,
            ),
          ),
        ),
      );
    }else if(ficha.telefono== 56912457889){
      return new Container(
        child: new Center(
          child: new Text(
              "En dentición decidua se examinan las caras vestibulares de 55, 65, 51 y 71. 12A  Diente con dos diagnósticos se toma el más severo.",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
              color: Colors.amberAccent,
            ),
          ),
        ),
      );
    }

  }
}
