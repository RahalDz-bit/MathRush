import 'package:flutter/material.dart';
import 'package:mathrush/Pages/game.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Level()));
}

int c = 0 ;


class Level extends StatefulWidget {
  const Level({super.key});

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {

  //save ezhighscore
   void saveezhs () async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if(score > ezhighscore){
    ezhighscore = score;
    await pref.setInt("ezhighscore", ezhighscore);}
    
   }
  

  // get ezhighscore
   void getezhs () async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? _ezhightscore = pref.getInt("ezhighscore");
    if (_ezhightscore != null){
      setState(() {
        ezhighscore = _ezhightscore;
      });
      
    }
   }

   //save mdhighscore
   void savemdhs () async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if(score > mdhighscore){
    mdhighscore = score;
    await pref.setInt("mdhighscore", mdhighscore);}
    
   }
  

  // get mdhighscore
   void getmdhs () async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? _mdhightscore = pref.getInt("mdhighscore");
    if (_mdhightscore != null){
      setState(() {
        mdhighscore = _mdhightscore;
      });
      
    }
   }

   //save hdhighscore
   void savehdhs () async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if(score > hdhighscore){
    hdhighscore = score;
    await pref.setInt("hdhighscore", hdhighscore);}
    
   }
  

  // get hdhighscore
   void gethdhs () async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? _hdhightscore = pref.getInt("hdhighscore");
    if (_hdhightscore != null){
      setState(() {
        hdhighscore = _hdhightscore;
      });
      
    }
   }
   
   @override
  void initState() {
    super.initState();
    if (c== 1 &&score > ezhighscore){
    saveezhs();}
    getezhs();

    if (c== 2 &&score > mdhighscore){
    savemdhs();}
    getmdhs();

    if (c== 3 &&score > hdhighscore){
    savehdhs();}
    gethdhs();

    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Color.fromARGB(255, 36, 45, 70),

      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Level",
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            //easy
            RawMaterialButton(
              fillColor: const Color.fromARGB(255, 75, 85, 125),
              constraints: BoxConstraints(minHeight: 63, minWidth: 130),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    "Easy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    "Hight Score: $ezhighscore",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                c = 1;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => game()),
                  (route)=>false,

                );
              },
            ),
            SizedBox(height: 30),

            //medium
            RawMaterialButton(
              fillColor: const Color.fromARGB(255, 75, 85, 125),
              constraints: BoxConstraints(minHeight: 63, minWidth: 130),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    "Medium",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    "Hight Score: $mdhighscore",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                c = 2;

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => game()),

                  (route)=>false,

                );

              },
            ),
            SizedBox(height: 30),

            //hard
            RawMaterialButton(
              fillColor: const Color.fromARGB(255, 75, 85, 125),
              constraints: BoxConstraints(minHeight: 63, minWidth: 130),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    "Hard",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    "Hight Score: $hdhighscore",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                c = 3;

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => game()),
                  (route)=>false,

                );
              
              },
            ),
          ],
        ),
      ),
    );
  }
}
