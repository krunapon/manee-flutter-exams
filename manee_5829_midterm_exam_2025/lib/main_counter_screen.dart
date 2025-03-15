import 'package:flutter/material.dart';

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
      home: const CounterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Status'),
      ),
      body: const Center(
        child: CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  String _getCountStatus() {
    if (_count > 0) return "Positive";
    if (_count < 0) return "Negative";
    return "Zero";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$_count',
          style: const TextStyle(fontSize: 60),
        ),
        Text(_getCountStatus(),
            style: TextStyle(color: Colors.blue, fontSize: 30)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count--;
                });
              },
              child: const Text('-', style: TextStyle(fontSize: 30)),
            ),
            const SizedBox(height: 40, width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count = 0;
                });
              },
              child: const Text('Reset', style: TextStyle(fontSize: 30)),
            ),
            const SizedBox(height: 40, width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: const Text('+', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ],
    );
  }
}
