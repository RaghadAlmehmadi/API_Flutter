import 'package:flutter/material.dart';
import 'citylistscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CityListScreen(),
    );
  }
}


