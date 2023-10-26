import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:libelulas/models/user.dart';
import 'package:libelulas/models/user_manager.dart';

class AdminUsersManager extends ChangeNotifier {

List<Usuario> users = [];

final FirebaseFirestore firestore = FirebaseFirestore.instance;

StreamSubscription? _subscription;

  void updateUser(UsuarioAtenticacao? userManager) {  // Adicione '?' para tornar userManager opcional
    _subscription?.cancel();  // Use '?' para cancelar se _subscription não for nulo
    if (userManager != null && userManager.adminEnabled) {  // Verifique se userManager não é nulo
      _listenToUsers();
    } else {
      users.clear();
      notifyListeners();
    }
  }       

  void _listenToUsers(){
    _subscription = firestore.collection('users').snapshots()
      .listen((snapshot){
      users = snapshot.docs.map((d) => Usuario.fromDocument(d)).toList();
          users.sort((a, b) =>
            a.name!.toLowerCase().compareTo(b.name!.toLowerCase())); 
      notifyListeners();
    });
  }

  List<String> get names => users.map((e) => e.name as String).toList();

  @override
  void dispose() {
    _subscription?.cancel();  // Use '?' para cancelar se _subscription não for nulo
    super.dispose();
  }
}