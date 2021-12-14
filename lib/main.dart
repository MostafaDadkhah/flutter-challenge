import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  List<Number> numbers = new List<Number>.filled(0, Number(0), growable: true);

  void addRandamNumber() {
    Random random = Random();
    setState(() {
      numbers.addAll([Number((random.nextDouble() * 20).toInt())]);
    });
  }

  @override
  Widget build(BuildContext context) {
    var strNumbers = "";
    var sum = 0;

    for (var i in numbers) {
      strNumbers += i.number.toString() + ", ";
      sum = sum + i.number;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sum of the numbers " + strNumbers + " are:",
            ),
            Text(
              sum.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: decrement,
            tooltip: 'decremnet',
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: addRandamNumber,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  decrement() {
    var strNumbers = "";
    var sum = 0;
    List<Number> temp_numbers = [];
    setState(() {
      for (var i in numbers) {
        var x = BNumbers(i);
        strNumbers += x.decrement().toString() + ", ";
        sum = sum + x.number.number;

        strNumbers.split(',').forEach((element) {
          temp_numbers.add(Number(x.number.number));
        });
        numbers = [];
        numbers = temp_numbers;
      }
    });
  }
}

class Number {
  int number;
  Number(this.number);
}

class BNumbers {
  Number number;
  BNumbers(this.number);
  int decrement() {
    return number.number - 1;
  }
}
