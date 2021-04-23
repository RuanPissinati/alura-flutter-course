import 'package:flutter/material.dart';

void main() {
  runApp(
      ByteBankApp()
  );
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: ListTransferencias(),
      )
    );
  }
}


class FormularioDeTranferencia extends StatelessWidget {
  final TextEditingController _controladorInputConta = TextEditingController();
  final TextEditingController _controladorInputValor = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Formulario de Transferencia"),),
      body: Column(
        children: <Widget>[
          Editor(controlador: _controladorInputConta, rotulo:'Conta', dica: '1000'),
          Editor(controlador: _controladorInputValor, rotulo:'Valor', dica: '100.00',icone: Icons.monetization_on),

          ElevatedButton(
            child: Text('Enviar'),
            onPressed: () {
              _criarTranferencia(context);
            },
          )
        ],
      ),
    );
  }

  void _criarTranferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorInputValor.text);
    final double valor = double.tryParse(_controladorInputConta.text);

    if(numeroConta != null && valor != null){
      final TranfereciaCriada = Transferencia(numeroConta, valor);
      debugPrint('$TranfereciaCriada');
      Navigator.pop(context, TranfereciaCriada);
    }
  }
}


class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(

        controller: controlador,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null? Icon(icone): null,
          labelText: rotulo, // label form
          hintText: dica, // placeholder
        ),
      ),
    );
  }
}


class ListTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Byte bank'),),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100, 0.5)),
          ItemTransferencia(Transferencia(100, 0.5)),
          ItemTransferencia(Transferencia(100, 0.5)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioDeTranferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('Chegou no then');
            debugPrint('$transferenciaRecebida');

          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.conta.toString()),
        subtitle: Text(_transferencia.valor.toString()),
      ),
    );
  }
}
class Transferencia {
  final double valor;
  final int conta;
  Transferencia(this.conta, this.valor);

  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia {valor: $valor, conta: $conta }';
  }
}