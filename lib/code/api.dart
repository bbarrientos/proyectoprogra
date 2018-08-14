import 'dart:async';

import 'package:proyectoprograufro/modelo/ficha.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CodaAPi{
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = new GoogleSignIn();

  FirebaseUser firebaseUser;

  CodaAPi(FirebaseUser user) {
    this.firebaseUser = user;
  }
  static Future<CodaAPi> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
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
        .snapshots
        .listen((snapshot) => onChange(_fromDocumentSnapshot(snapshot)));
  }

  Ficha _fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data;

    return new Ficha(
        documentId: snapshot.documentID,
        externalId: data['id'],
        nombre: data['nombre'],
        direccion: data['direccion'],
        avatarUrl: data['image_url'],
        telefono: data['telefono'],
        fonasa: data['fonasa'],
        radiografias: new List<String>.from(data['radiografias']),
        notas: new List<String>.from(data['notas'])
    );
  }

}