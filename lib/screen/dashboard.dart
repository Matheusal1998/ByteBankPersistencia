import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contatos_list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.purple[900],

      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                  'images/1614171395-open-graph-logo-large-br.png'),
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Theme.of(context).primaryColor,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ContatoList(),
                        ));
                  },
                  child: Container(
                    color: Colors.purple[900],
                    height: 100,
                    width: 150,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.people, color: Colors.white, size: 36,),
                        Text('Contatos',
                          style: TextStyle(color: Colors.white, fontSize: 16),)
                      ],
                    ),
                  ),
                ),
              ),)

          ]
      ),
    );
  }
}
