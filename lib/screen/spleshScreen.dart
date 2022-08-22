import 'dart:async';

import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  double i = 0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, 'second');
      },
    );
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        i = i + 1/5;
      });
    });
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PANDAV ANIRUDDH",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                color: Colors.red,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(
              backgroundColor: Colors.red.shade50,
              value: i,
              color: Colors.amber,
            ),
            SizedBox(height: 30),
            LinearProgressIndicator(
              backgroundColor: Colors.red.shade50,
              value: i,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
