import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:libelulas/helpers/validators.dart';
import 'package:libelulas/models/user.dart';
import 'package:libelulas/models/user_maneger.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> skaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skaffoldKey,
      appBar: AppBar(
        title: const Text("entrar"),
        centerTitle: true,
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
                TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (!emailValid(email!)) return 'email invalido';
                      return null;
                    }),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: "Senha"),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass) {
                    if (pass!.isEmpty || pass.length < 6)
                      return 'senha invalida';
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text("esqueci minha senha")),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      context.read<UsuarioAtenticacao>().signIn(
                          Usuario(emailController.text, passController.text),
                          (e) {
                        print(e);
                      }, () {
                        print("Sucesso");
                      });
                    }
                  },
                  child: Text("Entrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
