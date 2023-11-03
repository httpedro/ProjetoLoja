import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: const [
        Color.fromARGB(255, 255, 196, 196),
        Color.fromARGB(255, 255, 243, 241)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color.fromARGB(183, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                color: Color.fromARGB(255, 255, 142, 142),
                size: 64,
              ),
              SizedBox(height: 16),
              Text(
                'Sucesso!',
                style: GoogleFonts.carroisGothic(
                  fontSize: 24,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Compra realizada com sucesso",
                style: GoogleFonts.carroisGothic(
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/base");
                },
                child: Text('Fechar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showSuccessModal(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SuccessModal();
    },
  );
}

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Principal'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showSuccessModal(context, 'Operação bem-sucedida!');
          },
          child: Text('Mostrar Tela de Sucesso'),
        ),
      ),
    );
  }
}
