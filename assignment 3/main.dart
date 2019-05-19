import 'package:flutter/material.dart';
import 'package:hello_world/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
        ),
      ),
      home: HomePage(),
    );
  }
}
