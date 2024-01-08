import 'package:flutter/material.dart';
import 'package:manee_5829_midterm_exam_2023/screens/random_courses.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    child: const Text("Next"),
                    onPressed: () {
                      Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) =>
                              const RandomCourses()));
                    },
              )));
  }
}