import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ficha {
  final DocumentReference documentReference =
      Firestore.instance.document("Casa/dummy");

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    //print("USer name: ${user.displayName}");
    return user;
  }

  void addFicha(
      String nombre, String direcccion, String telefono, String seguro) {
    Map<String, String> data = <String, String>{
      "Nombre": nombre,
      "Direccion": direcccion,
      "Telefono": telefono,
      "Seguro": seguro
    };
    documentReference.setData(data).whenComplete(() {
      print("Datos add");
    }).catchError((e) => print(e));
  }

  void removeFicha() {}
}

class MostrarFichas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Prueba').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document['title']),
              subtitle: new Text(document['type']),
            );
          }).toList(),
        );
      },
    );
  }
}
