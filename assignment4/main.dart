//tic tac toe
import 'package:flutter/material.dart';
import 'package:hello_world/HomePage.dart';

void main() {MediaQuery;runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}
