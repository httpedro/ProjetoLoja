import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:libelulas/helpers/firebase_erros.dart';
import 'package:libelulas/models/user.dart';

class UsuarioAtenticacao {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void signIn(Usuario userInfo, Function onFail, Function onSuccess) async {
    try {
      final UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userInfo.email.toString(), password: userInfo.password.toString());
      print(result.user?.uid);
      onSuccess();
    } on PlatformException catch (e) {
      print(e);
      onFail(errosAutenticar(e.code));
    }
  }
}
