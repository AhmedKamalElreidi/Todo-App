import 'package:flutter/material.dart';
// ignore: unused_import
// import 'package:todo_app/lib/main.dart';
class Ccounter extends StatelessWidget {  
  
  int allTodos;
  int allCompleted;
  // bool statusTrue;
  Ccounter({required this.allTodos,required this.allCompleted,});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.only(top: 27),
              child: Text(
                "$allCompleted/$allTodos",
                style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: allTodos==allCompleted ? Colors.greenAccent:Colors.white,
                    ),
              ),
            );
  }
}
