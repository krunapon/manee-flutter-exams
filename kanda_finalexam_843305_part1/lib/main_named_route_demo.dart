import 'package:flutter/material.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
        ),
        body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exit');
              },
              child: const Text('Launch screen'),
            )
        )
    );
  }
}

class ExitScreen extends StatelessWidget {
  const ExitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Exit Screen'),
        ),
        body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // use whichever suits your need
          children: const <Widget>[
            Text("Left", style:TextStyle(fontSize:24, fontWeight: FontWeight.bold)),
            Text("Right", style:TextStyle(fontSize:24, fontWeight: FontWeight.bold)),
          ],
        ))
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const FirstScreen(),
        '/exit': (context) => const ExitScreen(),
      }
    );
  }
}


