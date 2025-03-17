// main_profile_card.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleProfileScreen(),
    );
  }
}

class SimpleProfileScreen extends StatelessWidget {
  SimpleProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Profile Card')),
      body: Center(child: SimpleProfileCard()),
    );
  }
}

class SimpleProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage('images/profile.png')),
          SizedBox(height: 30),
          Text(
            "Manee Jaidee",
            style: const TextStyle(fontSize: 50.0, color: Colors.blue),
          ),
          SizedBox(height: 10),
          Text(
            "manee@thai.com",
            style: const TextStyle(fontSize: 30.0, color: Colors.brown),
          ),
        ],
      ),
    );
  }
}
