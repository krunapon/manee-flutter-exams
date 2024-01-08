import 'package:flutter/material.dart';
import 'package:manee_5829_final_exam_2023/screens/end_screen.dart';

class GamePlayChoice extends StatefulWidget {
  const GamePlayChoice(
      {Key? key,
      required this.bgColor,
      required this.text,
      required this.nextWidget,
      required this.qNum,
      required this.correct,
      required this.restart})
      : super(key: key);

  final Color bgColor;
  final String text;
  final String correct;
  final Widget? nextWidget;
  final int qNum;
  final bool restart;

  @override
  State<GamePlayChoice> createState() => _GamePlayChoiceState();
}

class _GamePlayChoiceState extends State<GamePlayChoice> {
  Color checkColor = Colors.red;
  bool isCorrect = false;
  bool isTap = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    debugPrint("widget.text is ${widget.text}");
    debugPrint("widget.correct is ${widget.correct}");
    if (widget.text == widget.correct) {
      checkColor = Colors.green;
      isCorrect = true;
      score = 1;
    } else {
      checkColor = Colors.red;
      isCorrect = false;
      score = 0;
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Score!"),
              content: (score == 1)
                  ? const Text('Congrats, you get 1 point')
                  : const Text('Sorry, you miss it!'),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"))
              ]);
        });
  }

  void handleTap(BuildContext context) {
    if (!isTap) {
      setState(() {
        isTap = true;
      });

      _showDialog(context);
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => widget.nextWidget ?? EndScreen(),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          handleTap(context);
        },
        child: Container(
            width: 180,
            height: 80,
            padding: const EdgeInsets.all(8),
            color: isTap ? checkColor : widget.bgColor,
            child: Center(
                child: Text(widget.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 40)))));
  }
}
