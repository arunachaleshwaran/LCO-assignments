import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
class NumberAudio {
  String audioURI, buttonText;
  MaterialColor buttonColor;
  NumberAudio(String aU, MaterialColor bC, String bT) {
    this.audioURI = aU;
    this.buttonColor = bC;
    this.buttonText = bT;
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();
  List<NumberAudio> numberList = [
    NumberAudio('one.wav', Colors.red, 'One'),
    NumberAudio('two.wav', Colors.blue, 'two'),
    NumberAudio('three.wav', Colors.green, 'three'),
    NumberAudio('four.wav', Colors.pink, 'four'),
    NumberAudio('five.wav', Colors.brown, 'five'),
    NumberAudio('six.wav', Colors.blueGrey, 'six'),
    NumberAudio('seven.wav', Colors.teal, 'seven'),
    NumberAudio('eight.wav', Colors.grey, 'eight'),
    NumberAudio('nine.wav', Colors.orange, 'nine'),
    NumberAudio('ten.wav', Colors.purple, 'ten'),
  ];

  play(String uri) {
    audioPlayer.play(uri);
  }

  Widget rows2(int i, BuildContext context) { 
    double h=MediaQuery.of(context).size.height/8;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SizedBox(
                height: h,
                child: RaisedButton(
                  color: numberList[i].buttonColor,
                  child: Text(numberList[i].buttonText,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onPressed: () => play(numberList[i].audioURI),
                )),
          ),
          Expanded(
            child: SizedBox(
                height: h,
                child: RaisedButton(
                  color: numberList[i + 1].buttonColor,
                  child: Text(numberList[i + 1].buttonText,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onPressed: () => play(numberList[i + 1].audioURI),
                )),
          )
        ],
      );}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spanish Nmber'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/logo.png'),
              ),
              Column(
                  children: <Widget>[
                    rows2(0, context),
                    rows2(2, context),
                    rows2(4, context),
                    rows2(6, context),
                    rows2(8, context)
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
