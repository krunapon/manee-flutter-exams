import 'package:flutter/material.dart';
import 'package:manee_5829_final_exam_2023/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EN843305 Final Exam 2/2022',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const FirstScreen(),
        },
    );
  }
}
