abstract class Operacao {
  void deposito(double valor);
  void saque(double valor);
  void extrato();
}

class Transacoes {
  DateTime data;
  double valorTransacao;
  String descricao;

  Transacoes({
    required this.data,
    required this.valorTransacao,
    required this.descricao,
  });
}

class Comum implements Operacao {
  int numeroDaConta;
  String nomeDoCorrentista;
  double saldo;
  List<Transacoes> transacoes;

  Comum({
    required this.numeroDaConta,
    required this.nomeDoCorrentista,
    required this.saldo,
    required this.transacoes,
  });

  @override
  void deposito(double valor) {
    saldo = saldo + valor;
    print("deposito de $valor feito com sucesso, seu saldo atual é $saldo");
  }

  @override
  void extrato() {
    // TODO: implement extrato
  }

  @override
  void saque(double valor) {
    if (saldo <= valor) {
      saldo = saldo - valor;
      print("saque de $valor feito com sucesso, seu saldo atual é $saldo");
      return;
    }
    print("saldo insuficiente, seu saldo é $saldo");
  }
}

class Poupanca extends Comum {
  int diaDoAniversarioDaConta;
  Poupanca({
    required int numeroDaconta,
    required String nomeDoCorrentista,
    required double saldo,
    required List<Transacoes> transacoes,
    required this.diaDoAniversarioDaConta,
  }) : super(
          numeroDaConta: numeroDaconta,
          nomeDoCorrentista: nomeDoCorrentista,
          saldo: saldo,
          transacoes: transacoes,
        );

  @override
  void deposito(double valor) {
    super.deposito(valor);
    print(saldo);
  }

  @override
  void extrato() {
    // TODO: implement extrato
  }

  @override
  void saque(double valor) {
    super.saque(valor);
    print(saldo);
  }
}

class Limite extends Comum {
  double valorLimite;
  Limite({
    required int numeroDaconta,
    required String nomeDoCorrentista,
    required double saldo,
    required List<Transacoes> transacoes,
    required this.valorLimite,
  }) : super(
          numeroDaConta: numeroDaconta,
          nomeDoCorrentista: nomeDoCorrentista,
          saldo: saldo,
          transacoes: transacoes,
        );

  @override
  void deposito(double valor) {
    saldo = saldo + valor;
    print("deposito de $valor feito com sucesso");
  }

  @override
  void extrato() {
    // TODO: implement extrato
  }

  @override
  void saque(double valor) {
    double saldoTotal = saldo + valorLimite;
    if (valor <= saldo) {
      saldo = saldo - valor;
      return;
    }
    if (saldoTotal <= saldo) {
      saldo = saldo - valor;
      return;
    }
    print("voce chegou ao limite de saldo");
  }
}

void main() {}
