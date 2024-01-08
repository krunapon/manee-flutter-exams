import 'package:flutter/material.dart';
import 'package:manee_5829_midterm_exam_2023/screens/list_display.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({super.key});

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
                              const ListDisplay()));
                    },
              )));
  }
}