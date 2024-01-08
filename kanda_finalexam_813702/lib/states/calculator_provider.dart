import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
    String _resultCheckMessage = "";
    bool _isCorrect = false;
    int _totalScore = 0;

    void checkAnswer(int answer, int result) {
      if (answer == result) {
        _isCorrect = true;
        _resultCheckMessage = "Congratulations!";
      } else {
        _isCorrect = false;
        _resultCheckMessage = "Sorry, it's incorrect";
      }
      notifyListeners();
    }

    void increment(int qNum, int score, bool restart) {
      debugPrint("qNum is $qNum restart is $restart, score is $score");
      if (restart == true) {
        _totalScore = 0;
      } else {
        _totalScore = qNum - 1;
      }
      debugPrint("before: $_totalScore");
      _totalScore = _totalScore + score;
      debugPrint("after: $_totalScore");
      notifyListeners();
    }

    bool hasNextProblem() {
      if (_totalScore == 2) {
        return false;
      } else {
        return true;
      }
    }
    String get resultCheckMessage => _resultCheckMessage;

    bool get isCorrect => _isCorrect;

    int get totalScore => _totalScore;
}