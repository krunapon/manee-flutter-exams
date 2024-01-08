import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kanda_finalexam_part3/states/calculator_provider.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key, required this.score}) : super(key: key);


  final String score;

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<CalculatorProvider>(
        create: (context) => CalculatorProvider(),
        child: Builder(builder: (context)
    {
      return Consumer<CalculatorProvider>(builder: (context, provider, child) {
        return MaterialApp(
            title: 'Flutter Navigation Exercise',
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Your total score is " +
                                          score,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    )),
                          ElevatedButton(
                              child: const Text("Restart"),
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              })
                        ]))));
      });
    }));
  }
}
