import 'package:flutter/material.dart';

void main() {
  runApp(const BasicAndText());
}

class BasicAndText extends StatelessWidget {
  const BasicAndText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Khon Kaen"),
      ),
      body: const Column(children: <Widget>[
        Center(
          child: Text(
            "Khon Kaen temples",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 30),
          ),
        ),
        Row(children: <Widget>[
          Image(
              image: AssetImage("images/kktemple.jpg"),
              width: 300,
              height: 200),
          Image(
              image: AssetImage("images/kktemple.jpg"), width: 300, height: 200)
        ])
      ]),
    ));
  }
}
