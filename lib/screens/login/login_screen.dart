import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("entrar"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email){
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Senha"),
                autocorrect: false,
                obscureText: true,
                validator: (pass){
                  return null;
                },
              ),
              Align(
                alignment:  Alignment.centerRight,
                child: TextButton(onPressed: (){
                  
                }, child: const Text("esqueci minha senha")),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Entrar"),),
            ],
          ),
        ),
      ),
    );
  }
}