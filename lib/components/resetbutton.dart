import 'package:flutter/material.dart';

class ResetBoardButton extends StatelessWidget {
  ResetBoardButton({@required this.resetFunction, @required this.resetIcon});

  final Function resetFunction;
  final IconData resetIcon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: resetFunction,
        hoverColor: Colors.grey[800],
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[700],
        child: Icon(resetIcon));
  }
}
