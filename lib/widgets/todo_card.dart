// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';

class Todecard extends StatelessWidget {
  // const Todecard({Key? key}) : super(key: key);

  String vartitle;
  bool doORnot;
  Function myfunc;
  Function delettask;
  int index;
  Todecard(
      {required this.vartitle,
      required this.myfunc,
      required this.doORnot,
      required this.index,
      required this.delettask});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                    color: doORnot ? Colors.black38 : Colors.white,
                    fontSize: 22,
                    decoration: doORnot
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 1.7),
              ),
              Row(
                children: [
                  Icon(
                    //Icons.close,
                    //Icons.check,
                    doORnot ? Icons.check : Icons.close,
                    size: 27,
                    color: doORnot ? Colors.green : Colors.red,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  IconButton(
                    onPressed: () {
                      delettask(index);
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 25,
                    color: Color.fromARGB(255, 255, 200, 192),
                  )
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.2),
              borderRadius: BorderRadius.circular(11)),
        ),
      ),
    );
  }
}
