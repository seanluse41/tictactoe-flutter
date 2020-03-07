import 'package:flutter/material.dart';
import 'package:tictactoe/screens/introscreen.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe Refactored',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: IntroScreen(),
    );
  }
}