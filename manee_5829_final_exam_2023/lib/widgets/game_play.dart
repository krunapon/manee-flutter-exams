import 'package:flutter/material.dart';
import 'package:manee_5829_final_exam_2023/widgets/game_play_question.dart';

class GamePlay extends StatefulWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  _GamePlayState createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  var quizData = {
    1: {
      "correct": "5",
      "title": "Question 1",
      "question": "2 + 3 = ?",
      "choices": ["5", "8"]
    },
    2: {
      "correct": "12",
      "title": "Question 2",
      "question": "7 + 5 = ?",
      "choices": ["10", "12"]
    }
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "DME Final Exam",
        // home: SnackBarDemo()
        home: Scaffold(
            body: GamePlayQuestion(
                qNum:1, qData:quizData, restart:false)));
  }
}
