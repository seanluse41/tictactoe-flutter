import 'package:flutter/material.dart';
import 'package:tictactoe/screens/introscreen.dart';
import 'package:flutter/services.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
