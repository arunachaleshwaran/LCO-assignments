//Scarch and win
import 'package:flutter/material.dart';
import 'package:hello_world/HomePage.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrach and win',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}
