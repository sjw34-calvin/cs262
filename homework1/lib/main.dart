/*
 * Sameer Mall
 * Homework 1 - Calculator App
 * CS 262 for Professor Vanderlinden @ Calvin University
 * Friday, September 27 2019
 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Homework 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final value1Controller = TextEditingController();
  final value2Controller = TextEditingController();
  String dropdownValue = '+';
  int totalAnswer = 0;
  void getTotal() {
    int value1 = int.parse(value1Controller.text);
    int value2 = int.parse(value2Controller.text);
    setState(() {
      if (dropdownValue == '+') {
        totalAnswer = value1 + value2;
      }
      if (dropdownValue == '/') {
        totalAnswer = value1 ~/ value2;
      }
      if (dropdownValue == '*') {
        totalAnswer = value1 * value2;
      }
      if (dropdownValue == '-') {
        totalAnswer = value1 - value2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Value 1"),
              keyboardType: TextInputType.number,
              controller: value1Controller,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Value 2"),
              keyboardType: TextInputType.number,
              controller: value2Controller,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['+', '-', '*', '/']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            RaisedButton(
              child: Text('Calculate'),
              onPressed: () {
                getTotal();
              },
            ),
            Text(totalAnswer.toString()),
          ],
        ),
      ),
    );
  }
}
