import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Square Root App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int number = 0;
  String result = 'Enter a number to compute square root.';

  Future<void> _navigateToComputeScreen(int number) async {
    // compute the result
    final computedResult = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComputeScreen(number)),
    );
    setState(() {
      // update the result with the format
      result = 'Square root of $number is $computedResult';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Square Root App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Enter a number',
                  labelStyle: TextStyle(fontSize: 26)),
              onChanged: (value) => setState(() => number = int.parse(value)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToComputeScreen(number),
              child: const Text('Compute Square Root'),
            ),
            const SizedBox(height: 20),
            Text(result, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class ComputeScreen extends StatefulWidget {
  final int number;

  const ComputeScreen(this.number, {super.key});

  @override
  ComputeScreenState createState() => ComputeScreenState();
}

class ComputeScreenState extends State<ComputeScreen> {
  double computedSquareRoot = 0.0;

  @override
  void initState() {
    super.initState();
    computedSquareRoot = sqrt(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compute Result'),
      ),
      body: Center(
        child: Text(
          'Square root of ${widget.number} is $computedSquareRoot',
          style: const TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context, computedSquareRoot),
        child: const Icon(Icons.check),
      ),
    );
  }
}
