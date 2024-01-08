import 'package:flutter/material.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Navigation Exercise',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(120, 60),
                                backgroundColor: Colors.blue,
                                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          child: const Text("Restart"),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          })
                    ]))));
  }
}
