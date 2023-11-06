import 'package:flutter/material.dart';
import 'package:tik_tak_game/game.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer ='X';

  bool gameOver = false;
  int turns =0;
  String result ='Result Loading....';
  Game game = Game();
  bool newValue = true;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/home.png"), 
        fit: BoxFit.cover),
    ),  child: SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 70,),
          Text("It's $activePlayer's Turn",
          style: const TextStyle(
            fontSize: 40,
            fontFamily: "Exo2",
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 229, 220, 116),
          ),),
          const SizedBox(height:45 ,),
          SizedBox(
            width: double.infinity,
            height: 320.0,
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal:40.0),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              children: List.generate(9, (index) => 
              InkWell(
                onTap: gameOver ? null : () {
                  _onTTap(index);
                  },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xffE4F1FF),
                  ),
                  child: Center(
                    child: Text(
                      ManagePlayer.playerX.contains(index)?
                      "X":
                      ManagePlayer.playerO.contains(index)?
                      "O":
                      "",
                    style: TextStyle(fontSize: 60,
                    color: ManagePlayer.playerX.contains(index)?
                      const Color(0xff443680):
                      const Color.fromARGB(255, 229, 210, 1)),),
                  ) ,
                ),
              ),),     
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  showDialog(
                    context: context, 
                    builder: (context){
                      return AlertDialog.adaptive(
                        title: const Text("Game System",
                        style: TextStyle(
                            fontFamily: "Exo2",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff443680),
                          ),
                        ),
                        content: SwitchListTile(
                          title: const Text("Play With Virtual Friend ?",
                          style: TextStyle(
                            fontFamily: "Exo2",
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xff443680),
                          ),),
                          value: isSwitched, 
                          onChanged: (newValue){
                              setState((){
                                isSwitched = newValue;
                              });
                              Navigator.of(context).pop();
                          }),
                        
                      );
                    });
                },
                child: Container(
                  width: 60,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffE4F1FF),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset("assets/icons/pairGamers.png",),
                  ),
                )),
              
              IconButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),),
                ),
                onPressed: (){
                  setState(() {
                    ManagePlayer.playerX=[];
                    ManagePlayer.playerO=[];
                    activePlayer ='X';
                    gameOver = false;
                    turns =0;
                    result ='Result Loading....';
                  });
                }, 
                icon: Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                     color: const Color(0xffE4F1FF),
                     borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Icon(Icons.replay,
                    color: Color(0xff443680),
                    size: 45,),
                ),)
            ],
          ),
          Text('$result ',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ],
      )),
      ),
    );
  }

 _onTTap(int index) async {

  if((ManagePlayer.playerX.isEmpty|| !ManagePlayer.playerX.contains(index))&&
      (ManagePlayer.playerO.isEmpty|| !ManagePlayer.playerO.contains(index)))
  {
      game.playGame(index, activePlayer);
      stateUpdate();
  }if(isSwitched && !gameOver && turns !=9){
    await game.autoPlay(activePlayer);
    stateUpdate();
  }
  
}

stateUpdate(){
  setState(() {
    activePlayer = (activePlayer == 'X') ? 'O' : 'X';
    turns++;
    String gameWinner = game.checkWinner();
    if(gameWinner != ""){
        result = "$gameWinner is the Winner";
    }
    else if(turns ==8){result = "The Game was Tied";}
  });
}


}