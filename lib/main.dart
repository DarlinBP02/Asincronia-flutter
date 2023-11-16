import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_asincronico/service/mockapi.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int lightningCount = 0;
  double lightningWidth = 0;
  int lightningSeconds = 0;
  int lightningValue = 0;

  int vehicleCount = 0;
  double vehicleWidth = 0;
  int vehicleSeconds = 0;
  int vehicleValue = 0;

  int personCount = 0;
  double personWidth = 0;
  int personSeconds = 0;
  int personValue = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asincronia en Flutter',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 206, 206, 206),
        appBar: AppBar(
          title: const Text(
            "Darlin Bravo - 7mo A",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromARGB(255, 0, 242, 181),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildItem(
                onPressed: () async {
                  setState(() {
                    lightningWidth = 200;
                    lightningSeconds = 1;
                  });
                  lightningValue = await MockApi().getFerrariInteger();
                  setState(() {
                    lightningCount = lightningValue;
                    lightningWidth = 0;
                    lightningSeconds = 0;
                  });
                },
                backgroundColor: Colors.lightGreen,
                icon: Icons.flash_on,
                color: Colors.lightGreen,
                value: lightningCount,
                width: lightningWidth,
                seconds: lightningSeconds,
              ),
              _buildItem(
                onPressed: () async {
                  setState(() {
                    vehicleWidth = 200;
                    vehicleSeconds = 3;
                  });
                  vehicleValue = await MockApi().getHyundaiInteger();
                  setState(() {
                    vehicleCount = vehicleValue;
                    vehicleWidth = 0;
                    vehicleSeconds = 0;
                  });
                },
                backgroundColor: Colors.orangeAccent,
                icon: Icons.directions_car,
                color: Colors.orangeAccent,
                value: vehicleCount,
                width: vehicleWidth,
                seconds: vehicleSeconds,
              ),
              _buildItem(
                onPressed: () async {
                  setState(() {
                    personWidth = 200;
                    personSeconds = 10;
                  });
                  personValue = await MockApi().getFisherPriceInteger();
                  setState(() {
                    personCount = personValue;
                    personWidth = 0;
                    personSeconds = 0;
                  });
                },
                backgroundColor: Colors.lightBlue,
                icon: Icons.person,
                color: Colors.lightBlue,
                value: personCount,
                width: personWidth,
                seconds: personSeconds,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem({
    required VoidCallback onPressed,
    required Color backgroundColor,
    required IconData icon,
    required Color color,
    required int value,
    required double width,
    required int seconds,
  }) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        AnimatedContainer(
          width: width,
          height: 15,
          decoration: BoxDecoration(color: color),
          duration: Duration(seconds: seconds),
        ),
        Text(
          value.toInt().toString(),
          style: TextStyle(color: color, fontSize: 25.0),
        ),
      ],
    );
  }
}
