import 'package:flutter/material.dart';
import 'package:proyectoprograufro/code/ficha.dart';

class NuevaFicha extends StatelessWidget {
  final TextEditingController nombre = new TextEditingController();
  final TextEditingController direccion = new TextEditingController();
  final TextEditingController seguro = new TextEditingController();
  final TextEditingController telefono = new TextEditingController();

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
                    nombre.text, direccion.text, telefono.text, seguro.text);
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
            leading: const Icon(Icons.accessibility),
            title: new TextField(
              controller: seguro,
              decoration: new InputDecoration(
                hintText: "Prevision",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone_android),
            title: new TextField(
              controller: telefono,
              maxLength: 9,
              maxLengthEnforced: true,
              decoration: new InputDecoration(
                hintText: "Celular",
              ),
            ),
          ),
          const Divider(
            height: 1.0,
          ),
          new ListTile(
            leading: const Icon(Icons.label),
            title: const Text('Nick'),
            subtitle: const Text('None'),
          ),
          new ListTile(
            leading: const Icon(Icons.today),
            title: const Text('Birthday'),
            subtitle: const Text('February 20, 1980'),
            trailing: const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Contact group'),
            subtitle: const Text('Not specified'),
          )
        ],
      ),
    );
  }
}
