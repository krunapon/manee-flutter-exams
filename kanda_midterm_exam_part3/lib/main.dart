import 'package:flutter/material.dart';
import './app_screens/listview.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  String title = "Kanda Exam Part 3";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var i = 3;
    return MaterialApp(
      title: title,
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kanda Midterm Exam Part 3')),
        body: BasicListView(),
          floatingActionButton:
          FloatingActionButton(
              child: Icon(Icons.add),
              tooltip: "Click to increment the number of philanthropists",
              onPressed: () {
                i++;
                debugPrint("The current number of philanthropists is $i");
              }
          )
      )
    );
  }
}

