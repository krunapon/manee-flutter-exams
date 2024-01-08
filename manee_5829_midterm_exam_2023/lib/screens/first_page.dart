import 'package:flutter/material.dart';
import 'package:manee_5829_midterm_exam_2023/screens/next_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.only(top:40.0, bottom:100.0),
                            decoration: const BoxDecoration(color: Colors.orange),
                            child: const Text(
                              'Midterm Exam 2/2022',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            )),
                        Image.asset('images/kanda-2022-12.jpg',
                            width: 400, height: 200, fit: BoxFit.contain),
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
                                color: Colors.orangeAccent))]))),
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
                                        color: Colors.orangeAccent))
                              ])),),
                        const NextButton()
                  ]))));
  }
}
