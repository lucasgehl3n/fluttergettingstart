import 'package:flutter/material.dart';

import 'screens/transferencia/lista.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Define em qual elemento começa o material app (tela principal)
      //Scaffold é um componente de layout default do material
      home: Scaffold(
        body: ListaTransferencias(),
      ),
      theme: ThemeData.dark(),
    );
  }
}
