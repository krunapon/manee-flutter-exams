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
      title: 'Course Cards Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CourseScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CourseCard(
          courseCode: 'EN843305',
          courseName: 'Mobile Application Development',
          instructor: 'Dr. Kanda Saikaew',
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseCode;
  final String courseName;
  final String instructor;
  final int credits;

  const CourseCard({
    super.key,
    required this.courseCode,
    required this.courseName,
    required this.instructor,
    this.credits = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            courseCode,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            courseName,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Instructor: $instructor',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Credits: $credits',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
