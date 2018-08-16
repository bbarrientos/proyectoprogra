import 'dart:async';

import 'package:proyectoprograufro/modelo/ficha.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CodaAPi {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = new GoogleSignIn();

  FirebaseUser firebaseUser;

  CodaAPi(FirebaseUser user) {
    this.firebaseUser = user;
  }
  static Future<CodaAPi> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return new CodaAPi(user);
  }

  Future<List<Ficha>> getTodasFichas() async {
    return (await Firestore.instance.collection('fichas').getDocuments())
        .documents
        .map((snapshot) => _fromDocumentSnapshot(snapshot))
        .toList();
  }
  StreamSubscription watch(Ficha ficha, void onChange(Ficha ficha)) {
    return Firestore.instance
        .collection('fichas')
        .document(ficha.documentId)
        .snapshots()
        .listen(((snapshot) => onChange(_fromDocumentSnapshot(snapshot))));
  }
  
  Future<List<Ficha>> getUsuarioFichas()async{

    final usuarioFicha = await getTodasFichas();
    List<Ficha> _fichass = [];
    List<Ficha> usableFicha=[];

    _fichass = usuarioFicha;
    print(_fichass.length);
    for (var i = 0; i < _fichass.length; i++) {
      //final uidd = _fichass.;
      //Ficha ficha = _fichass[1];
      //print(object)
      for (var j = 0; j <= 1; j++) {

        if(firebaseUser.uid == _fichass[i].usuariosId[j]){
          usableFicha.add(_fichass[i]);
         // print("Usuario "+firebaseUser.email);
          //print(_fichass[i].usuariosId[j]);
          //print("Pruba pasada**************************** i $i  j $j");
          //print(usableFicha);
        }
        //print(usableFicha);
      }
      print("object$i");
      print(usableFicha);
    }
    print("Sle");
    return usableFicha;
  } 

  Ficha _fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data;

    return new Ficha(
        documentId: snapshot.documentID,
        externalId: data['id'],
        nombre: data['nombre'],
        direccion: data['direccion'],
        avatarUrl: data['image_url'],
        usuariosId: new List<String>.from(data['usuariosId']),
        telefono: data['telefono'],
        fonasa: data['fonasa'],
        radiografias: new List<String>.from(data['radiografias']),
        notas: new List<String>.from(data['notas']));
  }
  Future atencion(Ficha ficha) async {
    await Firestore.instance
        .collection('trabajo')
        .document('${ficha.documentId}:${this.firebaseUser.uid}')
        .setData({});
  }
  // Future<bool> Trabajando(Ficha ficha) async {
  //   final trabajandoactualmente = await Firestore.instance
  //       .collection('trabajo')
  //       .document('${ficha.documentId}:${this.firebaseUser.uid}')
  //       .get();

  //   return trabajandoactualmente.exists;
  // }
}
