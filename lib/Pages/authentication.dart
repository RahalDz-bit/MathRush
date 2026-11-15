import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class auth extends StatefulWidget {
  const auth({super.key});

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {

  TextEditingController username = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

backgroundColor: Color.fromARGB(255, 36, 45, 70),
body:

Center(child: Container(
  color: Color.fromARGB(255, 41, 52, 83),
  width: 100,
  height: 80,
  child: Column(
    children: [
      TextField(
        maxLength: 10,
        keyboardType: TextInputType.name,
        controller: username,
        
        decoration: InputDecoration(
          counterText: "",
          hint:Text('username (eg :nigga)'), ),
          

      ),
     
    ],
  ),
))

    );
  }
}