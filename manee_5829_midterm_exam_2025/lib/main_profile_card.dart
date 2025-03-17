// main_profile_card.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Card')),
      body: const Center(
        child: ProfileCard(
          name: 'Manee Jaidee',
          jobTitle: 'Flutter Developer',
          email: 'manee@thai.com',
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String email;

  const ProfileCard({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage('images/profile.png')),
          SizedBox(height: 30),
          Text(
            name,
            style: const TextStyle(fontSize: 50.0, color: Colors.blue),
          ),
          SizedBox(height: 10),
          Text(
            email,
            style: const TextStyle(fontSize: 30.0, color: Colors.brown),
          ),
        ],
      ),
    );
  }
}
