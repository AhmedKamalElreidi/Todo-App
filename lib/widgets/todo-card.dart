// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String vartitle;
  final bool doneOrnot;
  final Function myFunc;
  final int index;
  final Function delete;
  const TodoCard(
      {Key? key,
      required this.vartitle,
      required this.doneOrnot,
      required this.myFunc,
      required this.index,
      required this.delete,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myFunc(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 18),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                vartitle,
                style: TextStyle(
                color: doneOrnot ? Colors.black : Colors.white,
                  fontSize: 33,
                   decoration: doneOrnot ? TextDecoration.lineThrough: TextDecoration.none,
                  ),
              ),
              Row(
                children: [
                  Icon(
                    // condition ? If-True : If-False
                    doneOrnot ? Icons.check : Icons.close,
                    color: doneOrnot ? Colors.green : Colors.red,
                    size: 27,
                  ),
                  IconButton(
                    onPressed: (){
                          delete(index);
                    },
                     icon: Icon(Icons.delete),
                     iconSize: 27,
                     color: Color.fromARGB(255, 199, 116, 110),
                     ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
