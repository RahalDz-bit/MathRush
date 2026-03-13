import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mathrush/Pages/gameover.dart';
import 'Number_Button.dart';
import 'level.dart';
import 'dart:math';
void main() {
  runApp(game());
}

String num = "";
int score = 0;
int ezhighscore = 0;
int mdhighscore = 0;
int hdhighscore = 0;

List<String> operations = ["x", "+", "-"];


Random random = Random();
int result = 0;

String op = operations[random.nextInt(3)];

int a =0;
int b = 0;



int timer_left = 30;

Number_button N1 = Number_button(1);
Number_button N2 = Number_button(2);
Number_button N3 = Number_button(3);
Number_button N4 = Number_button(4);
Number_button N5 = Number_button(5);
Number_button N6 = Number_button(6);
Number_button N7 = Number_button(7);
Number_button N8 = Number_button(8);
Number_button N9 = Number_button(9);
Number_button N0 = Number_button(0);

class game extends StatefulWidget {
  const game({super.key});

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {


   void choice (){

    if (c == 1){
      a = random.nextInt(10);
      b = random.nextInt(10);
    }
    else if (c == 2){
      a = random.nextInt(10) + random.nextInt(10)*10;
      b = random.nextInt(10);
    }
    else{
      a = random.nextInt(10) + random.nextInt(10)*10;
      b = random.nextInt(10) +random.nextInt(10)*10 ;
    }
   }

   void conventer (){
    setState(() {
      
    
    switch(op){
      case "x":
        result = a * b;
        break;
      case "+" :
        result = a + b;
        break;

      case "-":
        result = a - b;
        break;
    }
    int ? useranswer = int.tryParse(num);
    if (result == useranswer && useranswer!= null){
      timer_left++;
      score ++;
      choice();
     op = operations[random.nextInt(3)];
     num = ""; 
    }
    

    
   });
   }
  void time() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timer_left--;
      });

      if (timer_left == 0) {
        timer.cancel();
        gameover();
      }
    });
  }

  void delete() {
    setState(() {
      if (num.isNotEmpty) {

        num = num.substring(0, num.length - 1);
      }
    });
  }
  void gameover(){

    setState(() {
      
     
      if(timer_left == 0){
      Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context)=>GameOver()),
        (route)=>false,
      );
    }

    
    });
   
  }

  @override
  void initState() {
    super.initState();
    time();
    timer_left=30;
    //  a = random.nextInt(10);
    //  b = random.nextInt(10);
     op = operations[random.nextInt(3)];
     num = "";
     score =0;
     choice();
     
     
     
         
  }


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      
         Scaffold(
          
        backgroundColor: Color.fromARGB(255, 36, 45, 70),
        body: 
        
        Container(
          padding: EdgeInsets.all(9),
          child: 
          
          Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              
              SizedBox(height: 20),

              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 55, 65, 100),

                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Score: $score",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Time left: $timer_left",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 52),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                            Text(
                              "$a $op $b = ",

                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                          
                          Text(
                            num,

                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   RawMaterialButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, 
                        MaterialPageRoute(builder: (context)=>Level()),
                        (route)=>false);
                      },
                      constraints: BoxConstraints(minHeight: 55, minWidth: 75),
                      fillColor: const Color.fromARGB(255, 34, 211, 238),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.arrow_back),
                    ),


                  RawMaterialButton(
                  onPressed: () {
                    delete();
                  },
                  constraints: BoxConstraints(minHeight: 55, minWidth: 75),
                  fillColor: const Color.fromARGB(255, 34, 211, 238),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(Icons.backspace_outlined),
                
              ),
                 ],
               ),

              
              SizedBox(height: 30),

              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 75, 85, 125),

                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          N1.create(setState),
                          N2.create(setState),
                          N3.create(setState),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          N4.create(setState),
                          N5.create(setState),
                          N6.create(setState),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          N7.create(setState),
                          N8.create(setState),
                          N9.create(setState),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
      child: RawMaterialButton(
        onPressed: () {
         setState(() {
          if(num.length<=2){
           num = num + "-";}
         });
            
          
        },
        constraints: BoxConstraints(minHeight: 100, minWidth: 100),
        fillColor: const Color.fromARGB(255, 34, 211, 238),
        shape: CircleBorder(),
        child: Text(
          '-',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    ),

    
    
              N0.create(setState),
                          
                          
              RawMaterialButton(
        onPressed: () {
         setState(() {
          
          conventer();
         });
            
          
        },
        constraints: BoxConstraints(minHeight: 100, minWidth: 100),
        fillColor: const Color.fromARGB(255, 34, 211, 238),
        shape: CircleBorder(),
        child: Icon(
          Icons.check,
          size: 43,
        )
      ),      ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
