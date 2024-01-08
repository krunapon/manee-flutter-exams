import 'package:flutter/material.dart';
import 'package:kanda_finalexam_part3/app_screens/candidates_checker.dart';
 

class StartPage extends StatefulWidget {
  const StartPage({Key? key}): super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

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
                            'Kanda Final Exam Part 3',
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
                                  builder: (context) => CandidatesChecker()));
                        },
                      )))
            ],
          ),
        ));
  }
}
