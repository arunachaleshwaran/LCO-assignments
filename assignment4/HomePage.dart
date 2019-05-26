import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // link up images
  AssetImage cross, circle, edit;
  @override
  bool isCross;
  String message;
  List<String> gameState;
  //implement initState
  @override
  void initState() {
    super.initState();
    setState(() {
      isCross = true;
      // initlize the state of box with empty
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];
      this.message = '';
      cross = AssetImage('assets/cross.png');
      circle = AssetImage('assets/circle.png');
      edit = AssetImage('assets/edit.png');
    });
  }

  //TODO: playGame method
  playGame(int index) {
    if (this.gameState[index] == 'empty') {
      setState(() {
        if (this.isCross)
          this.gameState[index] = 'cross';
        else
          this.gameState[index] = 'circle';

        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  //TODO: Reset game method
  resetGame() {
    setState(() {
      isCross = true;
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];
      this.message = "";
    });
  }

  //TODO: get image method
  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  //TODO: check for win logic
  checkWin() {
    if (gameState[0] != 'empty' &&
        gameState[0] == gameState[1] &&
        gameState[2] == gameState[0])
      won(0);
    else if (gameState[3] != 'empty' &&
        gameState[3] == gameState[5] &&
        gameState[4] == gameState[3])
      won(3);
    else if (gameState[6] != 'empty' &&
        gameState[6] == gameState[7] &&
        gameState[8] == gameState[6])
      won(6);
    else if (gameState[0] != 'empty' &&
        gameState[0] == gameState[3] &&
        gameState[6] == gameState[0])
      won(0);
    else if (gameState[1] != 'empty' &&
        gameState[1] == gameState[4] &&
        gameState[7] == gameState[1])
      won(1);
    else if (gameState[2] != 'empty' &&
        gameState[2] == gameState[5] &&
        gameState[8] == gameState[2])
      won(2);
    else if (gameState[0] != 'empty' &&
        gameState[0] == gameState[4] &&
        gameState[8] == gameState[0])
      won(0);
    else if (gameState[2] != 'empty' &&
        gameState[2] == gameState[4] &&
        gameState[6] == gameState[2])
      won(2);
    else if (!gameState.contains('empty'))
      setState(() => this.message = 'Game Draw');
  }

  won(i) {
    setState(() => this.message = '${this.gameState[i]}Wins');
    Future.delayed(const Duration(seconds: 3), () => this.resetGame());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                    child: MaterialButton(
                      onPressed: () => this.playGame(i),
                      child: Image(
                        image: getImage(this.gameState[i]),
                      ),
                    ),
                    width: 100,
                    height: 100,
                  ),
            ),
          ),
          Container(
            child: Text(
              this.message,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  '#LCO',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.redAccent),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Follow me on GitHub@arunachaleshwaran',
                    style: TextStyle(fontSize: 15,color:Colors.grey ),
                  ),
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: resetGame,
                child: Icon(Icons.restore),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
