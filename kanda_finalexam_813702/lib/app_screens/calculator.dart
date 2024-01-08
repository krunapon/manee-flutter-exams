import 'package:flutter/material.dart';
import 'package:kanda_finalexam_part3/states/calculator_provider.dart';
import 'package:provider/provider.dart';
import 'package:kanda_finalexam_part3/app_screens/end_screen.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key, required this.qNum, required this.data, required this.restart})
      : super(key: key);

  final int qNum;
  final Map<dynamic, dynamic> data;
  final bool restart;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final resultController = TextEditingController();
  late int input1;
  late String operator;
  late int input2;
  late int result;
  late int answer;
  late String problem;

  @override
  void initState() {
    super.initState();
    input1 = widget.data[widget.qNum]['input1'];
    input2 = widget.data[widget.qNum]['input2'];
    operator = widget.data[widget.qNum]['operator'];
    result = widget.data[widget.qNum]['result'];
    problem = input1.toString() + operator + input2.toString() + " = ?";
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorProvider>(
        create: (context) => CalculatorProvider(),
        child: Builder(builder: (context) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Form(child: Consumer<CalculatorProvider>(
                builder: (context, provider, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          margin: const EdgeInsets.symmetric(vertical: 16.0),
                          child: const Text("Simple Maths Problem",
                              style:
                                  TextStyle(fontSize: 28, color: Colors.pink))),
                      const SizedBox(height: 16),
                      Text(problem,
                          style: const TextStyle(
                              fontSize: 26,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: resultController,
                        decoration: const InputDecoration(
                          hintText: "Type your answer",
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              child: const Text("Submit your answer"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white),
                              onPressed: () {
                                //getting the text from TextField and converting it into int
                                answer =
                                    int.parse(resultController.text.trim());
                                provider.checkAnswer(answer, result);
                                if (provider.isCorrect) {
                                  provider.increment(widget.qNum, 1, widget.restart);
                                } else {
                                  provider.increment(widget.qNum, 0, widget.restart);
                                }
                                Future.delayed(
                                    const Duration(milliseconds: 1000), () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => provider.isCorrect && widget.qNum <= (widget.data.length - 1)
                                          ? Calculator(
                                              qNum: widget.qNum + 1,
                                              data: widget.data,
                                              restart: false)
                                          : EndScreen(score:provider.totalScore.toString())));
                                });
                              })),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(provider.resultCheckMessage,
                          style: TextStyle(
                              fontSize: 26,
                              color: provider.isCorrect
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              )),
            ),
          );
        }));
  }
}
