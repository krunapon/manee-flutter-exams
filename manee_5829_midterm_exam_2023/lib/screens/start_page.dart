import 'package:flutter/material.dart';
import 'package:manee_5829_midterm_exam_2023/screens/button_next.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                  flex: 10,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('images/kanda-2022-12.jpg',
                            width: 400, height: 200, fit: BoxFit.contain),
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(20.0),
                            decoration: const BoxDecoration(color: Colors.pink),
                            child: const Text(
                              'Midterm Exam 2022/2',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            )),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text.rich(TextSpan(
                              text: 'By',
                              style: TextStyle(fontSize: 25),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '  Manee Jaidee',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.pinkAccent))
                              ])),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text.rich(TextSpan(
                              text: 'ID',
                              style: TextStyle(fontSize: 25),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '  642-28-5829',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.pinkAccent))
                              ])),
                        ),
                      ])),
              const ButtonNext()
            ],

          ),
        )));
  }
}
