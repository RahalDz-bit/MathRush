import 'package:flutter/material.dart';
import 'Pages/game.dart';
import 'Pages/level.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

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
