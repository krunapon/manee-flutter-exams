// STUDENT CODE
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentProfile(), // 1 point
    );
  }
}

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 2 points
        title: const Text('Student Profile'),
        centerTitle: true,
      ),
      body: Center(
        // 1 point
        child: Column(
          children: [
            Container(
              // 2 points
              padding: EdgeInsets.all(30),
              child: const CircleAvatar(
                radius: 200,
                backgroundImage: AssetImage('images/profile.png'),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Manee Jaidee',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue), // 2 points
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // 2 points
              children: const [
                Icon(Icons.badge),
                SizedBox(width: 10),
                Text('ID: 653040123-4',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent)),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center, // 2 points
              children: [
                Icon(Icons.school),
                SizedBox(width: 10),
                Text('Major: Computer Engineering',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange)),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Edit Profile'),
                      content: const Text(
                          'You want to edit the profile of Manee Jaidee'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                            // Add edit profile logic here
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }, // 1 point
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
