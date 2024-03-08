import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  String msg = "Message 1";

  const MyApp({});
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
            const Text(msg),
            const _buildMessage(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage() {
    const Text('Message 2');
  }
}
