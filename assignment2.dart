
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var colors = [
    Colors.lime,
    Colors.amber,
    Colors.green,
    Colors.lightBlue,
    Colors.brown,
    Colors.blue,
    Colors.purple,
    Colors.cyan
  ];
  var bg = Colors.white,fg=Colors.red;

  void setrandomColor() {
    var rand = Random().nextInt(7);
    print(rand);
    setState(() {
      bg = colors[rand];
      fg = colors[7-rand];
    });
  }

  var k = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BG Changer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Backgroud'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              child: Text(
                'have it',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: setrandomColor,
              color: fg,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        backgroundColor: bg,
      ),
    );
  }
}
