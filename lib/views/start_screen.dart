import 'package:flutter/material.dart';
import 'package:tik_tak_game/views/home.dart';

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


class ButtonOne extends StatelessWidget {
  const ButtonOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        maximumSize: MaterialStateProperty.all<Size>(const Size(140, 50)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),),
        backgroundColor: MaterialStateProperty.all(const Color(0xffF4E869)),
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context){
            return  const HomePage();
          }));
      }, 
       
      label: const Text("Start",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: Color(0xff443680),
        fontFamily: 'Exo2',
      ),),
      icon: const Icon(Icons.arrow_left_rounded,
      color: Color(0xff443680),
      size: 50,),
          );
  }
}