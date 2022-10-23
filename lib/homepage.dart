import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/buttons.dart';
import 'package:tic_tac_toe/show_dialog.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Buttons> buttonList =
  [
    Buttons(id: 1),
    Buttons(id: 2),
    Buttons(id: 3),
    Buttons(id: 4),
    Buttons(id: 5),
    Buttons(id: 6),
    Buttons(id: 7),
    Buttons(id: 8),
    Buttons(id: 9),

  ];
  late List<Buttons> gameButtons;
  int winner = 0;
  int xScore = 0;
  int oScore = 0;
  bool xTurn = true;
  List player1 = [];
  List player2 = [];
  List tieGame = [];

  @override
  void initState() {
    gameButtons = buttonList;
    super.initState();
  }

  void play(Buttons bl){
    setState(() {
      if(xTurn && bl.buttonText == ''){
        bl.buttonText = 'X';
        bl.buttonColor = Colors.red;
        player1.add(bl.id);
        xTurn = false;
      }else if(!xTurn && bl.buttonText == ''){
        bl.buttonText = 'O';
        bl.buttonColor = Colors.black;
        player2.add(bl.id);
        xTurn = true;
      }
      tieGame.add(bl.id);
      checkWinner();


      if(winner == 1 ){
        xScore += 1;
        showDialog(
            context: context,
            builder:(BuildContext context) {
             return DisplayDialog(title: 'Player1 won the game',callback: continueGame );
            }
        );
      }else if(winner == 2){
        oScore += 1;
        showDialog(
            context: context,
            builder:(BuildContext context) {
              return DisplayDialog(title: 'Player2 won the game',callback: continueGame );
            }
        );
      }else if(tieGame.length == 9 && winner != 1 && winner !=2){
        showDialog(
            context: context,
            builder:(context) {
              return DisplayDialog(title: 'Draw',callback: continueGame);
            }
        );
      }
    });
  }
  void continueGame(){
    if(Navigator.canPop(context))Navigator.pop(context);
    setState(() {
      player1 = [];
      player2 = [];
      tieGame = [];
      winner = 0;
      xTurn = true;
      for(int i = 0;i < gameButtons.length; i++){
        gameButtons[i].buttonText = '';
      }

      for(int i = 0; i < gameButtons.length; i++){
        gameButtons[i].buttonColor = Colors.grey;
      }
    });

  }
  void clearScoreBoard(){
    setState(() {
      player1 = [];
      player2 = [];
      winner = 0;
      xScore = 0;
      oScore = 0;
      xTurn = true;

      for(int i = 0;i < gameButtons.length; i++){
        gameButtons[i].buttonText = '';
      }
      for(int i = 0; i < gameButtons.length; i++){
        gameButtons[i].buttonColor = Colors.grey;
      }
    });
  }

  void checkWinner(){
    if(player1.contains(1)&& player1.contains(2)&& player1.contains(3)){
      winner = 1;
      print('Player1 won the game');
    }

    if(player1.contains(7)&& player1.contains(8)&& player1.contains(9)){
      winner = 1;
      print('Player1 won the game');
    }

    if(player1.contains(4)&& player1.contains(5)&& player1.contains(6)){
      winner = 1;
      print('Player1 won the game');
    }

    if(player1.contains(1)&& player1.contains(5)&& player1.contains(9)){
      winner = 1;
      print('Player1 won the game');
    }

    if(player1.contains(3)&& player1.contains(5)&& player1.contains(7)){
      winner = 1;
      print('Player1 won the game');
    }

    if(player1.contains(1)&& player1.contains(4)&& player1.contains(7)){
      winner = 1;
      print('Player1 won the game');
    }

    if(player1.contains(3)&& player1.contains(6)&& player1.contains(9)){
      winner = 1;
      print('Player1 won the game');
    }

    if(player1.contains(2)&& player1.contains(5)&& player1.contains(8)){
      winner = 1;
      print('Player1 won the game');
    }


    if(player2.contains(1)&& player2.contains(2)&& player2.contains(3)){
      winner = 2;
      print('Player2 won the game');
    }

    if(player2.contains(4)&& player2.contains(5)&& player2.contains(6)){
      winner = 2;
      print('Player2 won the game');
    }

    if(player2.contains(7)&& player2.contains(8)&& player2.contains(9)){
      winner = 2;
      print('Player2 won the game');
    }

    if(player2.contains(1)&& player2.contains(5)&& player2.contains(9)){
      winner = 2;
      print('Player2 won the game');
    }

    if(player2.contains(3)&& player2.contains(5)&& player2.contains(7)){
      winner = 2;
      print('Player2 won the game');
    }

    if(player2.contains(1)&& player2.contains(4)&& player2.contains(7)){
      winner = 2;
      print('Player2 won the game');
    }

    if(player2.contains(2)&& player2.contains(5)&& player2.contains(8)){
      winner = 2;
      print('Player2 won the game');
    }
    if(player2.contains(3)&& player2.contains(6)&& player2.contains(9)){
      winner = 2;
      print('Player2 won the game');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children:  [
             Container(
               margin: EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('X Score: ${xScore.toString()}',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w900
                  ),),
                  Text('O Score: ${oScore.toString()}',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900
                    ),)
                ],
              ),
            ),
          SizedBox(height: 40,),

          Expanded(
            flex: 9,
              child: Container(
                margin: EdgeInsets.only(left: 5,right: 5),
                child: GridView.builder(
                  itemCount: gameButtons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 9.0,
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 9.0,
                    ),
                    itemBuilder: (context, int index){
                      return ElevatedButton(
                          onPressed: () => play(gameButtons[index]),
                          child: Text(gameButtons[index].buttonText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0
                          ),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: gameButtons[index].buttonColor,
                          ),

                      );
                    }
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.only(bottom: 50),
                child: ElevatedButton.icon(
                    onPressed: () {
                      clearRecent();

                    },
                    icon: Icon(Icons.clear),
                    label: Text('Clear Recent')),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.only(bottom: 50),
                child: ElevatedButton.icon(
                      onPressed: () {
                          clearScoreBoard();

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                      ),
                      icon: Icon(Icons.clear),
                      label: Text('Clear Score Board')),
              ),
            ],
          ),

        ],
      ),
    );


  }
  void clearRecent(){
    setState(() {
      player1 = [];
      player2 = [];
      winner = 0;
      xTurn = true;

      for(int i = 0;i < gameButtons.length; i++){
        gameButtons[i].buttonText = '';
      }
      for(int i = 0; i < gameButtons.length; i++){
        gameButtons[i].buttonColor = Colors.grey;
      }
    });
  }
}
