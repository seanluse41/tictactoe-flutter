import 'package:flutter/material.dart';
import 'package:tictactoe/styles/constants.dart';

class ScoreBoard extends StatelessWidget {
  ScoreBoard({this.ohScore, this.exScore});

  final int ohScore;
  final int exScore;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "PLAYER X: $exScore",
                    style: scoreBoardStyle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "PLAYER O: $ohScore",
                style: scoreBoardStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
