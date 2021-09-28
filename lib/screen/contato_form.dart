import 'package:dev/database/DAO/ContatoDAO.dart';
import 'package:dev/database/app_database.dart';
import 'package:dev/models/contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContatoForm extends StatefulWidget {
  @override
  State<ContatoForm> createState() => _ContatoFormState();
}

class _ContatoFormState extends State<ContatoForm> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome completo',
                ),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _numeroController,
                decoration: InputDecoration(
                  labelText: 'Número',
                ),
                style: TextStyle(
                  fontSize: 16.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    final String nome = _nomeController.text;
                    final int numero = int.parse(_numeroController.text);
                    final Contato contato = Contato(nome, numero, 0);
                    save(contato).then((id) => Navigator.pop(context));
                  },
                  child: Text('Criar'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
