import 'package:flutter/material.dart';
import 'package:kanda_finalexam_part3/app_screens/calculator.dart';
 

class StartPagePart1 extends StatefulWidget {
  const StartPagePart1({Key? key}): super(key: key);

  @override
  State<StartPagePart1> createState() => _StartPagePart1State();
}

class _StartPagePart1State extends State<StartPagePart1> {
  var qData = {
    1: {
      "input1": 3,
      "input2": 4,
      "operator": " + ",
      "result": 7
    },
    2: {
      "input1": 5,
      "input2": 3,
      "operator": " - ",
      "result": 2
    },
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Navigation Exercise',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 10,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('images/kanda1993.jpeg',
                            width: 400, height: 200, fit: BoxFit.contain),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Kanda Final Exam Part 1',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                        Text(
                          'By 642-28-5829',
                          style: TextStyle(color: Colors.pink[500], fontSize: 22),
                        )
                      ])),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        child: const Text("Start"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calculator(qNum:1 , data:qData, restart: true)));
                        },
                      )))
            ],
          ),
        ));
  }
}
