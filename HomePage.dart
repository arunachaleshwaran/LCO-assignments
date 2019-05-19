import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var img = <AssetImage>[
    AssetImage("assets/one.png"),
    AssetImage("assets/two.png"),
    AssetImage("assets/three.png"),
    AssetImage("assets/four.png"),
    AssetImage("assets/five.png"),
    AssetImage("assets/six.png"),
  ];
  AssetImage dice;
  @override
  void initState() {
    super.initState();
    setState(() => dice = AssetImage('assets/one.png'));
  }

  void roll() => setState(() => dice = img[Random().nextInt(6)]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: dice, width: 200, height: 200),
              Container(
                height: 40,
              ),
              ClipOval(
                child: RaisedButton(
                  padding: EdgeInsets.all(20),
                  onPressed: roll,
                  animationDuration: Duration(seconds: 1),
                  child: Text('click',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,decorationColor:Colors.red,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
