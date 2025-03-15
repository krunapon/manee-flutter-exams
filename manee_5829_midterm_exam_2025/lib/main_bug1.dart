import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  CounterWidgetState createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Count: $_counter', style: TextStyle(fontSize: 30)),
        ElevatedButton(
          onPressed: () {
            _counter++;
          },
          child: Text('Increment', style: TextStyle(fontSize: 20)),
        ),
      ],
    ));
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: CounterWidget()),
      debugShowCheckedModeBanner: false,
    );
  }
}
