import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:libelulas/helpers/firebase_erros.dart';
import 'package:libelulas/models/user.dart';


class UsuarioAtenticacao extends ChangeNotifier {

  UsuarioAtenticacao(){
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  Usuario? user;

  bool _loading = false;
  bool get loading => _loading;

  bool get isLoggedIn => user != null;

  Future<void> signIn(Usuario userInfo, Function onFail, Function onSuccess) async {
    loading = true;
    try {
      final UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userInfo.email.toString(), password: userInfo.password.toString());

      await _loadCurrentUser(firebaseUser: result.user);
      print(result.user?.uid);
      onSuccess();
    } on PlatformException catch (e) {
      print(e);
      print('Em signIn ocorreu uma exceção');
      onFail(errosAutenticar(e.code));
    }
    loading = false;
  }

  Future<void> signUp(Usuario userInfo, Function onFail, Function onSuccess) async {
    loading = true;
    try{
      final UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userInfo.email.toString(), password: userInfo.password.toString());

      userInfo.id = result.user?.uid;
      user = userInfo;

      await userInfo.saveData();

      print(result.user?.uid);
      onSuccess();      
    } on PlatformException catch (e) {
      print(e.stacktrace);
      onFail(errosAutenticar(e.code));
    }
    loading = false;
  }

  void signOut(){
    auth.signOut();
    user = null;
    notifyListeners();
  }

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({User? firebaseUser}) async{
    final User? currentUser = firebaseUser ?? auth.currentUser;
    if(currentUser != null){
      final DocumentSnapshot docUser = await FirebaseFirestore.instance.collection('users')
        .doc(currentUser.uid).get();
      user = Usuario.fromDocument(docUser);

    final docAdmin = await firestore.collection('admins').document(user.id).get();
    if(docAdmin.exists){
      user.admin = true;

    }

      notifyListeners();
    }
  }

  bool get adminEnabled => user != null && user.admin;
}