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
    // 1. Compute the result

    setState(() {
      // 2. Update the result
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
              //  3. Call the method to navigate to the ComputeScreen
              child: const Text('Compute Square Root'),
            ),
            const SizedBox(height: 20),
            // 4. Use the widget Text to display the result
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
        // 5. Go back to the previous screen and send the result back
        child: const Icon(Icons.check),
      ),
    );
  }
}
