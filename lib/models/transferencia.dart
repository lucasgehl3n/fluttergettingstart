class Transferencia {
  final double valor;
  final int numConta;

  @override
  String toString() {
    return "Valor: $valor, Número Conta: $numConta";
  }

  Transferencia(
    this.valor,
    this.numConta,
  );
}
