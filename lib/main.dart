import 'package:contact/screen/contactScreen.dart';
import 'package:contact/screen/spleshScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

StreamController streamController = StreamController();

void main() {

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey,
      systemNavigationBarColor: Colors.black,
    ),
  );

  var darkTheme = ThemeData(
    textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
    appBarTheme: AppBarTheme(color: Colors.blueAccent, centerTitle: true),
    brightness: Brightness.dark,
  );
  var lightTheme = ThemeData(
    textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
    appBarTheme: AppBarTheme(color: Colors.blueAccent, centerTitle: true),
    brightness: Brightness.light,
  );

  runApp(
    StreamBuilder(
      initialData: false,
      stream: streamController.stream,
      builder: (context, data) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: data.data as bool ? darkTheme : lightTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => SpleshScreen(),
            'second': (context) => contact(),
          },
        );
      },
    ),
  );
}
