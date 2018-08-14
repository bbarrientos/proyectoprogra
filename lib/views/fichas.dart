import 'package:flutter/material.dart';
import 'package:proyectoprograufro/code/ficha.dart';

class Fichas extends StatefulWidget{
  @override
  Elementos createState() => new Elementos();
}

class Elementos extends State<Fichas> {
  final TextEditingController nombre = new TextEditingController();
  final TextEditingController direccion = new TextEditingController();
  final TextEditingController edad = new TextEditingController();
  final TextEditingController nota = new TextEditingController();

  bool isChecked = false;

  void onChange(bool value){
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                ficha().addFicha(
                    nombre.text, direccion.text, edad.text, isChecked,nota.text);
              })
        ],
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              controller: nombre,
              decoration: new InputDecoration(
                hintText: "Nombre Paciente",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.home),
            title: new TextField(
              controller: direccion,
              decoration: new InputDecoration(
                hintText: "Direccion",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone_android),
            title: new TextField(
              controller: edad,
              maxLength: 9,
              maxLengthEnforced: true,
              decoration: new InputDecoration(
                hintText: "Edad",
              ),
            ),
          ),


          new CheckboxListTile(
            title: Text("Fonasa"),
            activeColor: Colors.redAccent,
            value: isChecked,
            onChanged: (bool value){
              onChange(value);
            },

          ),


          const Divider(
            height: 1.0,
          ),
          new ListTile(
            leading: const Icon(Icons.book),
            title: new TextFormField(
              maxLines: 10,
              controller: nota,
              decoration: new InputDecoration(
                  hintText: "Historial"
              ),

            ),
          )
        ],
      ),
    );
  }
}