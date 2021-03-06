import 'package:dev/database/DAO/ContatoDAO.dart';
import 'package:dev/database/app_database.dart';
import 'package:dev/models/contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contato_form.dart';

class ContatoList extends StatefulWidget {
  @override
  State<ContatoList> createState() => _ContatoList();
}

class _ContatoList extends State<ContatoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: [],
        future: Future.delayed(Duration(seconds: 1)).then((value) => FindAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contato>? contatos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contato = contatos![index];
                  return _ContatoItem(contato);
                },
                itemCount: contatos!.length,
              );
              break;
          }

          return Text('Erro !');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => ContatoForm(),
              ))
              .then((value) => {
                    setState(() {
                      widget.createState();
                    })
                  });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContatoItem extends StatelessWidget {
  final Contato contato;

  _ContatoItem(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(
            contato.nome,
            style: TextStyle(fontSize: 24.0),
          ),
          subtitle: Text(
            contato.numero.toString(),
            style: TextStyle(fontSize: 16.0),
          )),
    );
  }
}
