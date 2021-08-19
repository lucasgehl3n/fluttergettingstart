import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/transferencia.dart';

import 'formulario.dart';

//StatelessWidget é estático, stateful modifica
//Tela principal que exibe a lista de transferências
class ListaTransferencias extends StatefulWidget {
  //Lista de transferências
  //Se for constante mantenho no widget (aqui), se for variavel mantenho no state (abaixo)
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tranferências'),
      ),
      body: ListView.builder(
        //Exibe a lista de transferências
        itemCount: widget._transferencias.length,
        itemBuilder: (context, i) {
          final transferencia = widget._transferencias[i];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        //Conteúdo do botão flutuante
        //Icone do botão flutuante
        child: Icon(Icons.add),
        onPressed: () => _acessarFormulario(),
      ),
    );
  }

  void _acessarFormulario() {
    final Future future = Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return FormularioTransferencia();
      }),
    );

    //Ação ao clicar em confirmar (volta para a tela principal com uma transferencia)
    future.then((transferenciaRecebida) {
      _atualiza(transferenciaRecebida);
      //Sem o set state não constroi o build
    });
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    setState(() {
      widget._transferencias.add(transferenciaRecebida);
    });
  }
}
