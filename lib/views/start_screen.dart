import 'package:flutter/material.dart';
import 'package:tik_tak_game/widgets/start_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/start.png"), 
        fit: BoxFit.cover),
  ),
        child:  const Center(
          child: Padding(
            padding: EdgeInsets.only(top:280.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ButtonOne())),
        ),
      ),
    );
  }
}


