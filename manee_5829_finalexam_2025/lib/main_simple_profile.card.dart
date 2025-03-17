import 'package:flutter/material.dart';
import 'simple_profile_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Profile Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Cards')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using only the required parameter
            const SimpleProfileCard(name: 'Manee Jaidee'),

            const SizedBox(height: 20),

            // Using both required and optional parameters
            SimpleProfileCard(name: 'Piti Deejai', program: "COE"),
          ],
        ),
      ),
    );
  }
}
