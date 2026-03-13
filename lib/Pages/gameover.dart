import 'package:flutter/material.dart';
import 'package:mathrush/Pages/game.dart';
import 'package:mathrush/Pages/level.dart';

void main() {
  runApp(GameOver());
}

class GameOver extends StatefulWidget {
  const GameOver({super.key});

  @override
  State<GameOver> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GameOver> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                  "Game Over",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              
              RawMaterialButton(
                constraints: BoxConstraints(
                  minHeight: 63,
                  minWidth: 63,
                ),
              fillColor: const Color.fromARGB(255, 34, 211, 238),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                color: Colors.white,
                size : 43,
                Icons.restart_alt_outlined),
                onPressed: (){
                Navigator.pushAndRemoveUntil(
          
                  context ,
                  MaterialPageRoute(builder: (context)=>game()),
                  (route)=> false,
                );
                
              }),
              SizedBox(height: 12,),
              RawMaterialButton(
                constraints: BoxConstraints(
                  minHeight: 63,
                  minWidth: 63,
                ),
              fillColor: const Color.fromARGB(255, 34, 211, 238),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              
              child: Icon(
                color: Colors.white,
                size : 43,
                Icons.home),
                onPressed: (){
                Navigator.pushAndRemoveUntil(
          
                  context ,
                  MaterialPageRoute(builder: (context)=>Level()),
                 (route)=>false,

                );
                
              }),
            ],
          ),
        ),
      ),
    );
  }
}
