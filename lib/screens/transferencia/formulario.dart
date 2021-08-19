import 'package:flutter/material.dart';
import 'package:flutter_first_app/components/editor.dart';
import 'package:flutter_first_app/models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormularioTransferenciaState();
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerCampoNumConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar Transferência')),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controllerCampoNumConta,
            rotulo: 'Número da Conta',
            dica: '0000',
          ),
          Editor(
            controlador: _controllerCampoValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () => _criarTransferencia(context),
          )
        ],
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controllerCampoNumConta.text);

    final double? valor = double.tryParse(_controllerCampoValor.text);

    if (valor != null && numeroConta != null) {
      final novaTransferencia = Transferencia(valor, numeroConta);
      Navigator.pop(context, novaTransferencia);
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numConta.toString()),
      ),
    );
  }
}
