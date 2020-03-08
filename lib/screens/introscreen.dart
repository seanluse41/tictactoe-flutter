import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/styles/constants.dart';
import 'gamescreen.dart';
import 'package:page_transition/page_transition.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "TIC TAC TOE",
                    style: introText,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: AvatarGlow(
                  endRadius: 140,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 1),
                  startDelay: Duration(seconds: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none,
                        ),
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      radius: 80.0,
                      child: Container(
                        child: Image.asset(
                          "assets/images/tictactoe.png",
                          color: Colors.white,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rotate,
                        duration: Duration(seconds: 1),
                        child: GameScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(30),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "PLAY GAME",
                        style: playGameButton,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
