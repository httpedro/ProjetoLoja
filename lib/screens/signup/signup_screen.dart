import "package:flutter/material.dart";

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nome completo'),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Senha'),
                obscureText: true,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Repita a senha'),
                obscureText: true,
              ),
              const SizedBox(height: 16,),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: (){

                  },
                  child: const Text('Criar Conta'),
                ),
              )
            ],
          ),
        )
        ),
    );
  }  
}