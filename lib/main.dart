import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //var leftdicenumber= 1;
  // Note this won't work on hot reload as only byuld method is calLEd on hot reload so add it in build methods
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void randomizeBoth() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  void reset() {
    leftDiceNumber = 1;
    rightDiceNumber = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                  child: TextButton(
                // requires a void callback means nor arguments () and no data {}
                onPressed: () {
                  setState(() {
                    randomizeBoth();
                    print('leftDiceNumber = $leftDiceNumber');
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              )),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      randomizeBoth();
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.red,

            ),
            onPressed: () {
              setState(() {
                reset();
              });
            },
          )
        ],
      ),
    );
  }
}
