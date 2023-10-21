import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String? name;
  String? email;
  String? password;
  String? id;

  String? confirmPassword;

  bool admin = false;

  Usuario({this.email, this.password, this.name, this.id});

  Usuario.fromDocument(DocumentSnapshot document){
    name = document.get('name');
    email = document.get('email');
    id = document.id;
  }

  DocumentReference get firestoreRef =>
    FirebaseFirestore.instance.doc('users/$id');

  CollectionReference get cartReference =>
      firestoreRef.collection('cart');


  Future<void> saveData() async{
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'email': email,
    };
  }
}
