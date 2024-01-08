import 'package:flutter/material.dart';

class BasicAndText extends StatefulWidget {
  const BasicAndText({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BasicAndTextState();
}

class _BasicAndTextState extends State<BasicAndText> {
  double count = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(title: Text("Sample StatefulWidget")),
          body:
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.orangeAccent,
                width:50, height:40,
                child: Text("$count",
                        textAlign: TextAlign.center),
              )
            ),
        )
    );
  }
}