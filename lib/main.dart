import 'package:dev/screen/contato_form.dart';
import 'package:dev/screen/contatos_list.dart';
import 'package:dev/screen/dashboard.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';
import 'models/contato.dart';

void main() {
  runApp(const BytybankApp());
}

class BytybankApp extends StatelessWidget {
  const BytybankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.purple,
          ),
          textTheme:
              const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.purple[900],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Dashboard(),
    );
  }
}
