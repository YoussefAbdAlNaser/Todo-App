// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_card.dart';
import 'package:todo_app/widgets/counnter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

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
    Task(title: "GYM", status: false),
    Task(title: "Watch course", status: true),
    Task(title: "Run", status: false),
    Task(title: "Play Ps", status: true),
    Task(title: "Reading", status: false),
  ];
  deletetask(int numindex) {
    setState(() {
      allTasks.remove(allTasks[numindex]);
    });
  }

  deleteALLtask() {
    setState(() {
      allTasks.clear();
    });
  }

  changestatus(int taskindex) {
    setState(() {
      allTasks[taskindex].status = !allTasks[taskindex].status;
    });
  }

  final myController = TextEditingController();
  addnewtask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

  int caldonetask() {
    int counnter = 0;
    allTasks.forEach((item) {
      if (item.status) {
        counnter++;
      }
    });
    return counnter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TO DO APP ",
          style: TextStyle(
              fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              deleteALLtask();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 34,
            color: Color.fromARGB(255, 255, 200, 192),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Counter(
                numtask: allTasks.length,
                completetask: caldonetask(),
              ),
              Container(
                height: 702,
                color: Color.fromARGB(255, 55, 63, 62),
                margin: EdgeInsets.only(
                  top: 34,
                ),
                child: ListView.builder(
                    itemCount: allTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Todecard(
                        vartitle: allTasks[index].title,
                        doORnot: allTasks[index].status,
                        myfunc: changestatus,
                        index: index,
                        delettask: deletetask,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                child: Container(
                  height: 234,
                  padding: EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 34,
                        decoration: InputDecoration(hintText: "Add New task"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addnewtask();
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        child: Text(
                          "Add",
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      ),
    );
  }
}
