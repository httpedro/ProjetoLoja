import "package:flutter/material.dart";
import "package:libelulas/helpers/validators.dart";
import "package:libelulas/models/user.dart";
import "package:libelulas/models/user_manager.dart";
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final Usuario user = Usuario();

  SignUpScreen({super.key});

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
          child: Form(
            key: formkey,
            child: Consumer<UsuarioAtenticacao>(
              builder: (_, usuarioAtenticacao, __){
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Nome completo'),
                      enabled: !usuarioAtenticacao.loading,
                      validator: (name){
                        if(name.toString().isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      onSaved: (name) => user.name = name,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      enabled: !usuarioAtenticacao.loading,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email){
                        if(email.toString().isEmpty) {
                          return 'Campo obrigatório';
                        } else if(!emailValid(email.toString()))
                          return 'E-mail inválido';
                        return null;
                      },
                      onSaved: (email) => user.email = email,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Senha'),
                      enabled: !usuarioAtenticacao.loading,
                      obscureText: true,
                      validator: (pass){
                        if(pass.toString().isEmpty) {
                          return 'Campo obrigatório';
                        } else if(pass.toString().length < 6)
                          return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => user.password = pass,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Repita a senha'),
                      enabled: !usuarioAtenticacao.loading,
                      obscureText: true,
                      validator: (pass){
                        if(pass.toString().isEmpty) {
                          return 'Campo obrigatório';
                        } else if(pass.toString().length < 6)
                          return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => user.confirmPassword = pass,
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: usuarioAtenticacao.loading ? null : (){
                          if(formkey.currentState!.validate()){
                            formkey.currentState!.save();

                            if(user.password != user.confirmPassword){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Senhas não coincidem!'),
                                )
                              );
                            }

                            else{
                              usuarioAtenticacao.signUp(
                                user, 
                                (e){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Falha ao cadastrar usuário: $e'),
                                    )
                                  );
                                }, 
                                (){
                                  debugPrint('sucesso');
                                  Navigator.of(context).pop();
                                }
                              );
                            }
                          }
                        },
                        child: usuarioAtenticacao.loading ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                        : const Text('Criar Conta'),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        )
        ),
    );
  }  
}