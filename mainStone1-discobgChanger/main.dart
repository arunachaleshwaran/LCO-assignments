import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
    ));
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final col = [
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.amberAccent,
    Colors.cyan,
    Colors.lime,
    Colors.indigo,
    Colors.white,
    Colors.teal,
    Colors.deepPurple,
];
Widget buildIt() =>GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemCount: 50,
          itemBuilder: (context, k) => AnimatedContainer(
            duration: Duration(seconds:1),
            color: col[Random().nextInt(col.length)],margin: EdgeInsets.all(3),
            curve: Curves.linearToEaseOut,),
        ); 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildIt(),
        Center(
          child: GestureDetector(onTap: ()=>setState(buildIt),
                      child: Container(
              height: 200,
              // color: Colors.pink,
              decoration: BoxDecoration(
                color: Colors.blue,
                gradient: RadialGradient(
                  colors: [Colors.red, Colors.blue],
                  radius: .9,
                  focalRadius: .2,
                  focal: Alignment(-.90,.90),
                ),
                // backgroundBlendMode: BlendMode.xor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset.fromDirection(.200),
                      blurRadius: 10,
                      spreadRadius: .1),
                  BoxShadow(
                      offset: Offset.fromDirection(.01),
                      blurRadius: 30,
                      spreadRadius: 1),
                ],
              ),
              width: 200,
              
            ),
          ),
        ),
      ],
    );
  }
}
