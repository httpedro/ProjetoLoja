import 'package:flutter/material.dart';
import 'package:libelulas/helpers/validators.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                  validator: (emaill){
                    if(!emailValid(emaill!))
                      return 'email valido';
                    return 'email invalido';
                  },
                ),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: "Senha"),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass){
                    if(pass!.isEmpty || pass.length < 6)
                      return 'email invalida';
                    return null;
                  },
                ),
                Align(
                  alignment:  Alignment.centerRight,
                  child: TextButton(onPressed: (){
                    
                  }, child: const Text("esqueci minha senha")),
                ),
                ElevatedButton(onPressed: (){
                  if(formkey.currentState!.validate()){
                    print(emailController.text);
                  }

                }, child: Text("Entrar"),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}