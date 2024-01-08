import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manee_5829_final_exam_2023/screens/end_screen.dart';
import 'package:manee_5829_final_exam_2023/widgets/game_play_choice.dart';

class GamePlayQuestion extends StatefulWidget {
  const GamePlayQuestion({Key? key, required this.qNum, required this.qData,
    required this.restart})
      : super(key: key);
  final int qNum;
  final Map<dynamic, dynamic> qData;
  final bool restart;

  @override
  State<GamePlayQuestion> createState() => _GamePlayQuestionState();
}

class _GamePlayQuestionState extends State<GamePlayQuestion> {
  late String title;
  late String question;
  late String correct;
  late List<String> choices;
  bool previous = false;
  Widget? nextWidget;



  @override
  void initState() {
    super.initState();
    title = widget.qData[widget.qNum]["title"];
    question = widget.qData[widget.qNum]["question"];
    correct = widget.qData[widget.qNum]["correct"];
    choices = widget.qData[widget.qNum]["choices"];
    if (widget.qNum > 1 && widget.qNum <= widget.qData.length) {
      previous = true;
    }
    if (widget.qNum < widget.qData.length) {
      nextWidget =
          GamePlayQuestion(qNum: widget.qNum + 1, qData: widget.qData, restart: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600 ||
              MediaQuery
                  .of(context)
                  .orientation == Orientation.landscape) {
            return _buildWideScreenContainer(context);
          } else {
            return _buildPortraitContainer(context);
          }
        });
  }

  Widget _buildWideScreenContainer(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 30),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding:const EdgeInsets.all(30),
                  child: Text(
                    question,
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GamePlayChoice(
                                  bgColor: Colors.orangeAccent,
                                  text: choices[0],
                                  nextWidget: nextWidget,
                                  qNum: widget.qNum,
                                  correct: correct,
                                  restart: widget.restart),
                              GamePlayChoice(
                                  bgColor: Colors.purpleAccent,
                                  text: choices[1],
                                  nextWidget: nextWidget,
                                  qNum: widget.qNum,
                                  correct: correct,
                                  restart: widget.restart),
                            ]),])),
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: previous,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(100, 40),
                                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  backgroundColor: Colors.purpleAccent),
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Previous")),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 40),
                                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            child: const Text('Home'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            }),
                        Visibility(
                            visible: true,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(100, 40),
                                    backgroundColor: Colors.pinkAccent,
                                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        nextWidget ?? EndScreen())),
                                child: const Text("Next")))
                      ]))
            ])));
  } // _buildWideScreenContainer

  Widget _buildPortraitContainer(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 30),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding:const EdgeInsets.all(30),
                  child: Text(
                    question,
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GamePlayChoice(
                              bgColor: Colors.orangeAccent,
                              text: choices[0],
                              nextWidget: nextWidget,
                              qNum: widget.qNum,
                              correct: correct,
                              restart: widget.restart),
                          GamePlayChoice(
                              bgColor: Colors.purpleAccent,
                              text: choices[1],
                              nextWidget: nextWidget,
                              qNum: widget.qNum,
                              correct: correct,
                              restart: widget.restart),
                        ]),])),
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: previous,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 40),
                                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                backgroundColor: Colors.purpleAccent),
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Previous")),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 40),
                              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            child: const Text('Home'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            }),
                        Visibility(
                            visible: true,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(100, 40),
                                    backgroundColor: Colors.pinkAccent,
                                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        nextWidget ?? EndScreen())),
                                child: const Text("Next")))
                      ]))
            ])));
  } // _buildPortraitContainer
} // class
