import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(30),
            margin:
            const EdgeInsets.symmetric(
                horizontal: 20, vertical: 50),
            child: const Text(
              "Flutter",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 48,
                  fontWeight: FontWeight.w700),
            )));
  }
}
