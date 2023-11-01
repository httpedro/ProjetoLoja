import 'package:flutter/material.dart';

class SuccessModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 64,
            ),
            SizedBox(height: 16),
            Text(
              'Sucesso!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Compra realizada com sucesso",
              style: TextStyle(
                fontSize: 16,
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
