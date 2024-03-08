import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String msg = "Message 1";

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bug Examples'),
        ),
        body: Column(
          children: [
            Text(msg),
            _buildMessage(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage() {
    return const Text('Message 2');
  }
}
