import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: import images
  final AssetImage circle = AssetImage('assets/circle.png'),
      lucky = AssetImage('assets/rupee.png'),
      unlucky = AssetImage('assets/sadFace.png');
  //TODO: get an array
  List<String> itemArray;
  IconData right;
  int count;
  int luckyNumber;
  //TODO: inin array with 25 elements
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemArray = List<String>.generate(25, (index) => 'empty');
    generateRandomNumber();print(luckyNumber);
    right = Icons.cached;
    count = 0;
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);
    setState(() {
      luckyNumber = random;
    });
  }

  //TODO: define a getImage method
  AssetImage getImage(int index) => itemArray[index] == 'lucky'
      ? lucky
      : (itemArray[index] == 'unlucky' ? unlucky : circle);
  //TODO: play game method
  playGame(int index) {
    count++;
    if (luckyNumber == index)
      setState(() {
        itemArray[index] = 'lucky';
        right = Icons.thumb_up;
      });
    else
      setState(() {
        itemArray[index] = 'unlucky';
      });right=count<5?right:Icons.thumb_down;
  }

  //TODO: show all
  showAll() => setState(() {
        itemArray = List<String>.filled(25, 'unlucky');
        itemArray[luckyNumber] = 'lucky';
      });

  //TODO: reset all
  resetGame() {
    setState(() => itemArray = List<String>.filled(25, 'empty'));count=0;
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        alignment: Alignment.center,
        height: 30,
        child: Text('Follow me on GitHub@arunachaleshwaran',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
      appBar: AppBar(
        title: Text('Scratch and Win'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: itemArray.length,
              itemBuilder: (context, i) => SizedBox(
                      child: RaisedButton(
                    onPressed: () => count < 5 && right!=Icons.thumb_up ? this.playGame(i) : Null,
                    child: Image(
                      image: this.getImage(i),
                    ),
                  )),
            ),
          ),
          Row(
            children: <Widget>[
              RaisedButton(elevation: 0,
                  onPressed: resetGame,
                  color: Colors.pink,
                  padding: EdgeInsets.all(20),
                  child: Icon(right,color: Colors.white,)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 24, bottom: 24),
                  alignment: Alignment.center,
                  color: Colors.pink,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue,
                    child: Container(
                      color: Colors.pink,
                      padding: EdgeInsets.only(left:5,right:5),
                      child: Text(
                        '#LCO',
                        style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              RaisedButton(elevation: 0,
                  onPressed: showAll,
                  color: Colors.pink,
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.visibility,color: Colors.white,)),
            ],
          ),
        ],
      ),
    );
  }
}
