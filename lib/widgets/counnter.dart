// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  int numtask, completetask;
  Counter({required this.completetask, required this.numtask});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 22,
      ),
      child: Text(
        "$completetask/$numtask",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: completetask == numtask ? Colors.green : Colors.white,
        ),
      ),
    );
  }
}
