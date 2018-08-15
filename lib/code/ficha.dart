// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:proyectoprograufro/code/conexion.dart';
// // import 'package:proyectoprograufro/views/nuevaFicha.dart';

// class Ficha {
//   final validacion_gf val = new validacion_gf();
//  // final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = new GoogleSignIn();
//   Future<FirebaseUser> signIn() async {
//     return await FirebaseAuth.instance.currentUser();
//   }

//   // Future<FirebaseUser> _handleSignIn() async {
//   //   GoogleSignInAccount googleUser = await googleSignIn.signIn();
//   //   GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//   //   FirebaseUser user = await _auth.signInWithGoogle(
//   //     accessToken: googleAuth.accessToken,
//   //     idToken: googleAuth.idToken,
//   //   );

//   //   print("signed in " + user.email);
//   //   return user;
//   // }

//   void addFicha(String nombre, String direcccion, String edad, bool Fonasa,
//       String notas) {
//     // user = signIn();
//     Map<String, String> data = <String, String>{
//       "nombre": nombre,
//       "direccion": direcccion,
//       "edad": edad,
//       "fonasa": Fonasa.toString(),
//       "notas": notas
//       //"USerId": val.signIn().then((FirebaseUser user)=> user.email)
//     };
//     Firestore.instance
//         .collection('fichas')
//         .document()
//         .setData(data)
//         .whenComplete(() {
//       print("Datos add");
//     }).catchError((e) => print(e));
//   }
//   void removerFIchas(){

//   }
// }

// class MostrarFichas extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new StreamBuilder<QuerySnapshot>(
//       stream: Firestore.instance.collection('fichas').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) return new Text('Loading...');
//         return new ListView(
//           children: snapshot.data.documents.map((DocumentSnapshot document) {
//             /*return Column(
//               children: <Widget>[
//                 Text(snapshot.data.documents[1]['nombre']),
//                 Text(snapshot.data.documents[0]['edad'].toString()),

//               ],
//             );*/
//             return new ListTile(

//               title: new Text(document['nombre']),
//               subtitle: new Text(document['notas'].toString()),
//               onTap: () {
//                 print("CLick*********");
//                 Firestore.instance.document('nombre').delete();
//                 //snapshot.data.documents.map['nombre'],
//                 //document("nombre").delete();
//                 /*NuevaFicha().createState().modificarFicha(
//                     document['nombre'],
//                     document["direccion"],
//                     document['edad'],
//                     document['fonasa'],
//                     document['notas']);
//                 Navigator.pushNamed(context, '/NuevaFicha');*/
//               },

//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }

// class EditarFichas extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {}
// }
