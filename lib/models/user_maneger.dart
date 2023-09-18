import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:libelulas/models/user.dart';

class UsuarioAtenticacao {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void signIn(Usuario userInfo) async {
    try {
      final UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userInfo.email, password: userInfo.password);
      print(result.user?.uid);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
