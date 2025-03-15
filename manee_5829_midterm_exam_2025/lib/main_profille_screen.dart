// main.dart
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Container(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            // Column is needed to arrange elements vertically
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Manee Jaidee',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Software Developer', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 40),
              Row(
                // Row for horizontal arrangement of skills
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // Center the skills
                children: [
                  _buildSkillChip('Flutter'),
                  _buildSkillChip('Dart'),
                  _buildSkillChip('UI'),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: TextStyle(fontSize: 20)),
    );
  }
}
