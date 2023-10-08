import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:libelulas/models/user_maneger.dart';
import 'package:libelulas/screens/base/base_screen.dart';
import 'package:libelulas/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  //Lendo documentos da pasta 'pedidos'
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('pedidos').get();
  for(DocumentSnapshot document in snapshot.docs){
    print(document.data());
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<UsuarioAtenticacao>(
      create: (_) => UsuarioAtenticacao(),
      child: MaterialApp(
        title: 'Loja Libélula',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 87, 238),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => SignUpScreen()
              );
            case '/base':
            default:
              return MaterialPageRoute(
              builder: (_) => BaseScreen()
            );
          }
        },
      ),
    );
  }
}
