import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:tik_tak_game/views/start_screen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
          backgroundColor: const Color(0xff443680),
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget:  Image.asset("assets/images/splash.png"),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen:  const StartScreen(),
        );
  }
}