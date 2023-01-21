// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo-card.dart';
import 'package:todo_app/widgets/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TodoApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  List allTasks = [
    Task(title: "publish video", status: true),
    Task(title: "laugh", status: true),
    Task(title: "gym", status: true)
  ];
  delete(int clickTask){
    setState(() {
      allTasks.remove(allTasks[clickTask]); 
    });
  }
  deleteAll(){
    setState(() {
      allTasks.removeRange(0, allTasks.length);
          });
  }
  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status =!allTasks[taskIndex].status;
    });
  }

  addNewtask() {
    setState(() {
      allTasks.add(Task(title: myController.text, status: true));
    });
  }

  final myController = TextEditingController();
  int calcCompleteTask() {
    int completeTask = 0;
    allTasks.forEach((item) {
      if (item.status) {
        completeTask++;
      }
    });
    return completeTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  padding: EdgeInsets.all(22),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      TextField(
                        maxLength: 30,
                        controller: myController,
                        decoration: InputDecoration(
                          hintText: "ADD New Task",
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                        onPressed: () {
                          addNewtask();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
                    onPressed: (){
                    deleteAll();
                    },
                     icon: Icon(Icons.delete_forever),
                     iconSize: 37,
                     color: Color.fromARGB(255, 199, 116, 110),
                     ),
        ],
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        elevation: 0,
        title: Text(
          "To Do APP",
          style: TextStyle(
              fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Ccounter(
              allTodos: allTasks.length,
              allCompleted: calcCompleteTask(),
            ),
            Container(
              height: 500,
              // color: Colors.amber,
              child: ListView.builder(
                  //   padding: const EdgeInsets.all(8),
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoCard(
                        vartitle: allTasks[index].title,
                        doneOrnot: allTasks[index].status,
                        myFunc:changeStatus,
                        index :index,
                        delete: delete,
                       // myFunc:changeStatus(),
                        );

                  }),
            ),
            // ...allTasks.map((item) =>
            //     TodoCard(vartitle: item.title, doneOrnot: item.status)),
          ],
        ),
      ),
    );
  }
}
