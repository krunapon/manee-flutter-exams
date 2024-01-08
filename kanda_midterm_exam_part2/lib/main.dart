import 'package:flutter/material.dart';
import './app_screens/philanthropists.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  String title = "Kanda Exam Part 2";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Philantropists(title: title),
      debugShowCheckedModeBanner: false,
    );
  }
}

