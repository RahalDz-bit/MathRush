import 'package:flutter/material.dart';
import 'game.dart';

class Number_button {
  int? number = 0;

  Number_button(int? n) {
    this.number = n;
  }

  Widget create(Function mainSetState) {
    return SizedBox(
      child: RawMaterialButton(
        onPressed: () {
          mainSetState(() {
            if (num.length <= 3){
            num = num + number.toString();}
          });
        },
        onHighlightChanged: (num){
            if (num == true ){}
        },
      
        constraints: BoxConstraints(minHeight: 100, minWidth: 100),
        fillColor: const Color.fromARGB(255, 34, 211, 238),
        shape: CircleBorder(),
        child: Text(
          '$number',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
