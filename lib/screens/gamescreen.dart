import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool ohTurn = false; // x goes first

  List<String> displayExOh = [
    "", // one space to avoid win condition
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[700],
                  ),
                ),
                child: Center(
                  child: Text(
                    displayExOh[index],
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _tapped(index) {
    setState(() {
      if (ohTurn) {
        displayExOh[index] = "O";
      } else {
        displayExOh[index] = "X";
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayExOh.every((square) => square.isNotEmpty)) {
      // first row
      if (displayExOh[0] == displayExOh[1] &&
          displayExOh[0] == displayExOh[2]) {
        _showWinDialog(displayExOh[0]);
      }
      // second row
      if (displayExOh[3] == displayExOh[4] &&
          displayExOh[3] == displayExOh[5]) {
        _showWinDialog(displayExOh[3]);
      }
      //third row
      if (displayExOh[6] == displayExOh[7] &&
          displayExOh[6] == displayExOh[8]) {
        _showWinDialog(displayExOh[6]);
      }
      //first column
      if (displayExOh[0] == displayExOh[3] &&
          displayExOh[0] == displayExOh[6]) {
        _showWinDialog(displayExOh[0]);
      }
      //second column
      if (displayExOh[1] == displayExOh[4] &&
          displayExOh[1] == displayExOh[7]) {
        _showWinDialog(displayExOh[1]);
      }
      //third column
      if (displayExOh[2] == displayExOh[5] &&
          displayExOh[2] == displayExOh[8]) {
        _showWinDialog(displayExOh[2]);
      }
      //diagnol
      if (displayExOh[6] == displayExOh[4] &&
          displayExOh[6] == displayExOh[2]) {
        _showWinDialog(displayExOh[6]);
      }
      //diagnol
      if (displayExOh[0] == displayExOh[4] &&
          displayExOh[0] == displayExOh[8]) {
        _showWinDialog(displayExOh[0]);
      }
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("WINNER IS:" + winner),
          );
        });
  }
}
