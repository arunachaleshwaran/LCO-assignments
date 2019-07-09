// youthParlinment Session
import 'package:flutter/material.dart';
import 'Topics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xffFF6E0B),
          canvasColor: Color(0xffBCDDE8),
          buttonColor: Color(0xff6E9DCC),
          ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Value.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 4,
        elevation: 0,
        title: Center(
            child: Text('SpeakLit',
                style: TextStyle(
                    letterSpacing: 7,
                    fontSize: 24,
                    fontWeight: FontWeight.w600))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: LayoutBuilder(
          builder: (context, constrain) => GridView.builder(
              itemCount: Value.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: constrain.maxWidth * .02,
                  mainAxisSpacing: constrain.maxWidth * .02),
              itemBuilder: (constrain, i) => RaisedButton(
                    disabledColor: Colors.transparent,
                    onPressed: Value[i].click
                        ? null
                        : () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.lightBlueAccent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Future.delayed(
                                            Duration(seconds: 1));
                                        setState(() => Value[i].click = true);
                                        Navigator.of(context).pop();
                                      },
                                      child: LayoutBuilder(
                                          builder: (context, constrain) =>
                                              Container(
                                                  width: constrain.maxWidth,
                                                  alignment: Alignment.center,
                                                  height: constrain.maxHeight,
                                                  child: Text(
                                                    Value[i].content,textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.cyan[400],
                                                        fontSize: 30),
                                                  ))),
                                    )));
                          },
                  )),
        ),
      ),
//      body: StreamBuilder(
//        builder: (context, snapshot) => Center(
//            child:
//                CircularProgressIndicator(value: (snapshot.data % 300) / 300)),
//        stream: _stream,
//      ),
    );
  }
}
