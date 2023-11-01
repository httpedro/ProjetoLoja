import 'package:flutter/material.dart';
import 'package:libelulas/helpers/validators.dart';
import 'package:libelulas/models/user.dart';
import 'package:libelulas/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> skaffoldKey = GlobalKey<ScaffoldState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skaffoldKey,
      appBar: AppBar(
        title: const Text("Fazer login"),
        backgroundColor: Colors.transparent, //cabeçalho
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
                horizontal:
                    20.0), // Adicione margens horizontais para criar espaço
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/signup');
              },
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 237, 141, 141),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              ),
              child: const Text(
                "CRIAR CONTA",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                Container(
                  width: 100,
                  height: 110,
                  child: Image.network(
                      "https://static.vecteezy.com/system/resources/previews/012/177/132/original/dragonfly-silhouette-free-png.png"),
                ),
                TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (!emailValid(email!)) return 'E-mail inválido';
                      return null;
                    }),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: "Senha"),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass) {
                    if (pass!.isEmpty || pass.length < 6) {
                      return 'Senha invalida';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text("Esqueci minha senha")),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      context.read<UsuarioAtenticacao>().signIn(
                          Usuario(
                              email: emailController.text,
                              password: passController.text), (e) {
                        print(e);
                      }, () {
                        print("Sucesso");
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 229, 144, 138),
                  ),
                  child: const Text("Entrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
