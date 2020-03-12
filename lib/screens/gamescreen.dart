import 'package:flutter/material.dart';
import 'package:tictactoe/components/scoreboard.dart';
import 'package:tictactoe/styles/constants.dart';
import 'package:tictactoe/components/resetbutton.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool ohTurn = false; // x goes first
  int xScore = 0;
  int oScore = 0;

  List<String> displayExOh = [
    "",
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
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ScoreBoard(
                exScore: xScore,
                ohScore: oScore,
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
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
                              style: exOhStyle,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
        floatingActionButton: displayExOh.every((element) => element == "")
            ? ResetBoardButton(
                resetFunction: _clearScore,
                resetIcon: Icons.remove_circle_outline)
            : ResetBoardButton(
                resetFunction: _clearBoard,
                resetIcon: Icons.refresh,
              ));
  }

  void _tapped(index) {
    setState(() {
      if (ohTurn && displayExOh[index] == "") {
        displayExOh[index] = "O";
        ohTurn = !ohTurn;
      } else if (!ohTurn && displayExOh[index] == "") {
        displayExOh[index] = "X";
        ohTurn = !ohTurn;
      }
      _checkWinner();
    });
  }

  void _checkWinner() {
    // first row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != "") {
      _showWinDialog(displayExOh[0]);
    }
    // second row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != "") {
      _showWinDialog(displayExOh[3]);
    }
    //third row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != "") {
      _showWinDialog(displayExOh[6]);
    }
    //first column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != "") {
      _showWinDialog(displayExOh[0]);
    }
    //second column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != "") {
      _showWinDialog(displayExOh[1]);
    }
    //third column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != "") {
      _showWinDialog(displayExOh[2]);
    }
    //diagnol
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != "") {
      _showWinDialog(displayExOh[6]);
    }
    //diagnol
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != "") {
      _showWinDialog(displayExOh[0]);
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("WINNER IS: " + winner),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text("PLAY AGAIN?"),
              )
            ],
          );
        });
    if (winner == "O") {
      oScore += 1;
    } else if (winner == "X") {
      xScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = "";
      }
    });
  }

  void _clearScore() {
    setState(() {
      xScore = 0;
      oScore = 0;
    });
  }
}
