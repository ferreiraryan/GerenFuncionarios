class Funcionario {
  final int _id;
  late String _nome;
  late String _cargo;
  late double _salario;

  Funcionario(this._id, this._nome, this._cargo, this._salario);

  double get salario => _salario;

  set salario(novo_salario) {
    if (novo_salario < 0) {
      print('Salario não pode ser negativo!');
      return;
    }
    if (_salario == novo_salario) {
      print('Salario continua o mesmo!');
    } else if (_salario < novo_salario) {
      print('Salario foi aumentado!');
    } else {
      print('Salario foi diminuido!');
    }

    _salario = novo_salario;
  }

  void exibir_salario() {
    print(_salario);
  }

  void aumentarSalario(double percentual) {
    _salario = _salario + (_salario * percentual);
  }

  void exibirInformacoes() {
    //return 'Id: ${_id} \nNome: ${_nome} \nCargo: ${_cargo} \nSalário: ${_salario}';
    print('''
        ${_nome}
    ---------------
    Id: ${_id}
    Nome: ${_nome} 
    Cargo: ${_cargo}
    Salário: ${_salario}
    ---------------        ''');
  }
}

class Empresa {
  late List<Funcionario> funcionarios = [];

  adicionarFuncionario(Funcionario funcionario) {
    funcionarios.add(funcionario);
  }

  void listarFuncionarios() {
    if (funcionarios.isEmpty) {
      print('Não contem nenhum funcionário!');
      return;
    }
    for (var funcionario in funcionarios) {
      funcionario.exibirInformacoes();
    }
  }

  void removerFuncionario(int id) {
    funcionarios.removeWhere((funcionario) => funcionario._id == id);
  }
}

void main(List<String> arguments) {
  Funcionario f1 = Funcionario(1, 'Roberto', 'TI', 2000.00);
  f1.aumentarSalario(0.10);
  f1.exibir_salario();

  Empresa e1 = Empresa();

  e1.adicionarFuncionario(f1);
  e1.listarFuncionarios();

  e1.removerFuncionario(1);
  e1.listarFuncionarios();
}
