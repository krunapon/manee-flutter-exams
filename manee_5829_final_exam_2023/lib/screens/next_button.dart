import 'package:flutter/material.dart';
import 'package:manee_5829_final_exam_2023/widgets/game_play.dart';

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
                    const GamePlay()));
              },
            )));
  }
}