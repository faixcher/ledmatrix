import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.deepPurple.shade200,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

// forloop

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  int _first_num = 0;
  int _second_num = 0;
  @override
  Widget build(BuildContext context) {
    print(count);
    const List<List<List<int>>> digits = [
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0]
      ],
      [
        [0, 0, 1, 0, 0],
        [0, 1, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 1, 1, 1, 0]
      ],
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 1, 0],
        [0, 0, 1, 0, 0],
        [0, 1, 0, 0, 0],
        [1, 1, 1, 1, 1]
      ],
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
        [0, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0]
      ],
      [
        [0, 0, 0, 1, 0],
        [0, 0, 1, 1, 0],
        [0, 1, 0, 1, 0],
        [1, 0, 0, 1, 0],
        [1, 1, 1, 1, 1],
        [0, 0, 0, 1, 0],
        [0, 0, 0, 1, 0]
      ],
      [
        [1, 1, 1, 1, 1],
        [1, 0, 0, 0, 0],
        [1, 1, 1, 1, 0],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0]
      ],
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 0],
        [1, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0]
      ],
      [
        [1, 1, 1, 1, 1],
        [0, 0, 0, 0, 1],
        [0, 0, 0, 1, 0],
        [0, 0, 1, 0, 0],
        [0, 1, 0, 0, 0],
        [0, 1, 0, 0, 0],
        [0, 1, 0, 0, 0]
      ],
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0]
      ],
      [
        [0, 1, 1, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 1],
        [0, 0, 0, 0, 1],
        [1, 0, 0, 0, 1],
        [0, 1, 1, 1, 0]
      ]
    ];

    return Scaffold(
        appBar: _MyAppbar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MoveNumber(1),
            Container(
              width: 600.0,
              height: 450.0,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 15.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDigit(digits, _first_num),
                  SizedBox(
                    width: 50,
                  ),
                  _buildDigit(digits, _second_num),
                ],
              ),
            ),
            MoveNumber(0),
          ],
        ));
  }

  AppBar _MyAppbar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      title: Center(
          child: Text(
        'CP-SU LED MATRIX',
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      )),
    );
  }

  Column _buildDigit(var digits, int number) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 7; i++) _buildRow(digits[number][i]),
      ],
    );
  }

  Row _buildRow(var numbers) {
    return Row(
      children: [
        for (int i in numbers) _buildDot(i),
      ],
    );
  }

  Widget _buildDot(int num) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: num == 1 ? Colors.green : Colors.grey.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget MoveNumber(int increase) {
    Icon icon = increase == 1
        ? Icon(
            Icons.arrow_drop_up,
            size: 80,
          )
        : Icon(
            Icons.arrow_drop_down,
            size: 80,
          );

    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        onTap: () {
          setState(() {
            if (increase == 1)
              count++;
            else
              count--;
            if (count == 100) count = 0;
            if (count == -1) count = 99;

            _second_num = count % 10;
            _first_num = count ~/ 10;
          });
        },
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: icon,
        ),
      ),
    );
  }
}
