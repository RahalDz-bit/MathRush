import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/game.dart';
import 'Pages/level.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/authentication.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options :DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  void tranfer  () async{
    final SharedPreferences  pref = await SharedPreferences.getInstance();
    String? un = pref.getString("nameuser");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 36, 45, 70),
      body: Center(
        child: SizedBox(
          child: RawMaterialButton(
            fillColor: const Color.fromARGB(255, 75, 85, 125),
            constraints: BoxConstraints(minHeight: 66, minWidth: 96),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Level()),
              );
            },
            child: Text(
              'Play',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
