// import 'package:flutter/material.dart';
// import 'package:proyectoprograufro/code/ficha.dart';

// class NuevaFicha extends StatefulWidget{
//   @override
//   Elementos createState() => new Elementos();
// }

// class Elementos extends State<NuevaFicha> {

//    TextEditingController nombre = new TextEditingController();
//    TextEditingController direccion = new TextEditingController();
//    TextEditingController edad = new TextEditingController();
//    TextEditingController nota = new TextEditingController();
//    String nombre1,direccion1,edad1,notas1;
//    bool isChecked= false;

//   void modificarFicha(String nombredb, String direccciondb, String edaddb,bool Fonasadb,String notasdb){
//     this.nombre1 = nombredb;
//     this.direccion1 = direccciondb;
//     this.edad1 = edaddb;
//     this.isChecked = Fonasadb;
//     this.notas1 = notasdb;
//     print(nombre1);

//   }

//   void onChange(bool value){
//     setState(() {
//       isChecked = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.

//         actions: <Widget>[
//           new IconButton(
//               icon: const Icon(Icons.save),
//               onPressed: () {
//                 // Ficha().addFicha(
//                 //     nombre.text, direccion.text, edad.text, isChecked,nota.text);
//               })
//         ],
//       ),
//       body: new Column(

//         children: <Widget>[
//           new ListTile(
//             leading: const Icon(Icons.person),
//             title: new TextFormField(
//               initialValue: nombre1,

//               //controller: direccion,

//             ),
//           ),
//           new ListTile(
//             leading: const Icon(Icons.home),
//             title: new TextFormField(
//               initialValue: direccion1,
//               controller: direccion,

//             ),
//           ),
//           new ListTile(
//             leading: const Icon(Icons.phone_android),
//             title: new TextFormField(
//               initialValue: edad1,
//               controller: edad,
//               maxLength: 9,
//               maxLengthEnforced: true,

//             ),
//           ),


//           new CheckboxListTile(
//               title: Text("Fonasa"),
//               activeColor: Colors.redAccent,
//               value: isChecked,
//               onChanged: (bool value){
//                 onChange(value);
//               },

//           ),


//           const Divider(
//             height: 1.0,
//           ),
//           new ListTile(
//             leading: const Icon(Icons.book),
//             title: new TextFormField(
//               initialValue: notas1,
//               maxLines: 10,
//               controller: nota,
//               decoration: new InputDecoration(
//                 hintText: "Notas"
//               ),

//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
