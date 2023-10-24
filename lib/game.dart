import 'dart:math';

class ManagePlayer{

    static const X='X';
    static const O ='O';
    static const empty ='';
    static List<int> playerX=[];
    static List<int> playerO=[];
}

extension ContainsAll on List{
  bool containsAll(int x, int y,[int? z]){
    if(z == null)
    {
      return contains(x) && contains(y);
    }else
    {
      return contains(x) && contains(y)&& contains(z);
    }
    
  }
}

class Game {
  
  void playGame(index, String activePlayer) {
    if(activePlayer == 'X'){
      ManagePlayer.playerX.add(index);
    }else{
      ManagePlayer.playerO.add(index);
    }
  }

  String checkWinner(){
    String winnner ="";
    if(ManagePlayer.playerX.containsAll(0, 1, 2)||
       ManagePlayer.playerX.containsAll(3, 4, 5)||
       ManagePlayer.playerX.containsAll(6, 7, 8)||
       ManagePlayer.playerX.containsAll(0, 3, 6)||
       ManagePlayer.playerX.containsAll(1, 4, 7)||
       ManagePlayer.playerX.containsAll(2, 5, 8)||
       ManagePlayer.playerX.containsAll(0, 4, 8)||
       ManagePlayer.playerX.containsAll(2, 4, 6))    
    {winnner ="X";}
    else if(ManagePlayer.playerO.containsAll(0, 1, 2)||
       ManagePlayer.playerO.containsAll(3, 4, 5)||
       ManagePlayer.playerO.containsAll(6, 7, 8)||
       ManagePlayer.playerO.containsAll(0, 3, 6)||
       ManagePlayer.playerO.containsAll(1, 4, 7)||
       ManagePlayer.playerO.containsAll(2, 5, 8)||
       ManagePlayer.playerO.containsAll(0, 4, 8)||
       ManagePlayer.playerO.containsAll(2, 4, 6))
    {winnner ="O";}
    else{ winnner ="";}
    return winnner;
  }




  Future<void>autoPlay(activePlayer) async{
    int index =0;
    List<int> emptyCells =[];

    for(int i =0;i<10;i++){
    if(!(ManagePlayer.playerX.contains(i) || ManagePlayer.playerO.contains(i))){
      emptyCells.add(i);
    }
  }
  if(ManagePlayer.playerX.containsAll(0, 1)&& emptyCells.contains(2)||
     ManagePlayer.playerX.containsAll(4, 6)&& emptyCells.contains(2)||
     ManagePlayer.playerX.containsAll(5, 8)&& emptyCells.contains(2)
  ){index=2;}
  if(ManagePlayer.playerO.containsAll(0, 1)&& emptyCells.contains(2)||
     ManagePlayer.playerO.containsAll(4, 6)&& emptyCells.contains(2)||
     ManagePlayer.playerO.containsAll(5, 8)&& emptyCells.contains(2)
  ){index=2;}
  else if(ManagePlayer.playerX.containsAll(1, 2)&& emptyCells.contains(0)||
          ManagePlayer.playerX.containsAll(3, 6)&& emptyCells.contains(0)||
          ManagePlayer.playerX.containsAll(4, 8)&& emptyCells.contains(0)
  ){index=0;}
  else if(ManagePlayer.playerO.containsAll(1, 2)&& emptyCells.contains(0)||
          ManagePlayer.playerO.containsAll(3, 6)&& emptyCells.contains(0)||
          ManagePlayer.playerO.containsAll(4, 8)&& emptyCells.contains(0)
  ){index=0;}
  else if(ManagePlayer.playerX.containsAll(0, 2)&& emptyCells.contains(1)||
          ManagePlayer.playerX.containsAll(4, 7)&& emptyCells.contains(1)
  ){index=1;}
  else if(ManagePlayer.playerO.containsAll(0, 2)&& emptyCells.contains(1)||
          ManagePlayer.playerO.containsAll(4, 7)&& emptyCells.contains(1)
  ){index=1;}
  else if(ManagePlayer.playerX.containsAll(4, 5)&& emptyCells.contains(3)||
          ManagePlayer.playerX.containsAll(0, 6)&& emptyCells.contains(3)
  ){index=3;}
  else if(ManagePlayer.playerO.containsAll(4, 5)&& emptyCells.contains(3)||
          ManagePlayer.playerO.containsAll(0, 6)&& emptyCells.contains(3)
  ){index=3;}
  else if(ManagePlayer.playerX.containsAll(0, 8)&& emptyCells.contains(4)||
          ManagePlayer.playerX.containsAll(1, 7)&& emptyCells.contains(4)||
          ManagePlayer.playerX.containsAll(2, 6)&& emptyCells.contains(4)||
          ManagePlayer.playerX.containsAll(3, 5)&& emptyCells.contains(4)
  ){index=4;}
  else if(ManagePlayer.playerO.containsAll(0, 8)&& emptyCells.contains(4)||
          ManagePlayer.playerO.containsAll(1, 7)&& emptyCells.contains(4)||
          ManagePlayer.playerO.containsAll(2, 6)&& emptyCells.contains(4)||
          ManagePlayer.playerO.containsAll(3, 5)&& emptyCells.contains(4)
  ){index=4;}
  else if(ManagePlayer.playerX.containsAll(2, 8)&& emptyCells.contains(5)||
          ManagePlayer.playerX.containsAll(3, 4)&& emptyCells.contains(5)
  ){index=5;}
  else if(ManagePlayer.playerO.containsAll(2, 8)&& emptyCells.contains(5)||
          ManagePlayer.playerO.containsAll(3, 4)&& emptyCells.contains(5)
  ){index=5;}
  else if(ManagePlayer.playerX.containsAll(2, 4)&& emptyCells.contains(6)||
          ManagePlayer.playerX.containsAll(0, 3)&& emptyCells.contains(6)||
          ManagePlayer.playerX.containsAll(7, 8)&& emptyCells.contains(6)
  ){index=6;}
  else if(ManagePlayer.playerO.containsAll(2, 4)&& emptyCells.contains(6)||
          ManagePlayer.playerO.containsAll(0, 3)&& emptyCells.contains(6)||
          ManagePlayer.playerO.containsAll(7, 8)&& emptyCells.contains(6)
  ){index=6;}
  else if(ManagePlayer.playerX.containsAll(1, 4)&& emptyCells.contains(7)||
          ManagePlayer.playerX.containsAll(8, 6)&& emptyCells.contains(7)
  ){index=7;}
  else if(ManagePlayer.playerO.containsAll(1, 4)&& emptyCells.contains(7)||
          ManagePlayer.playerO.containsAll(8, 6)&& emptyCells.contains(7)
  ){index=7;}
  else if(ManagePlayer.playerX.containsAll(0, 4)&& emptyCells.contains(8)||
          ManagePlayer.playerX.containsAll(2, 5)&& emptyCells.contains(8)||
          ManagePlayer.playerX.containsAll(6, 7)&& emptyCells.contains(8)
  ){index=8;}
  else if(ManagePlayer.playerO.containsAll(0, 4)&& emptyCells.contains(8)||
          ManagePlayer.playerO.containsAll(2, 5)&& emptyCells.contains(8)||
          ManagePlayer.playerO.containsAll(6, 7)&& emptyCells.contains(8)
  ){index=8;}
  else
  {
  Random randon =Random();
  int randomIndex =randon.nextInt(emptyCells.length);
  index = emptyCells[randomIndex];
  playGame(index, activePlayer);
  }

  
  }
}