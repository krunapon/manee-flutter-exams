import 'package:flutter/material.dart';

class BasicAndText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("Hello");
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Thai Universities"),
      ),
      body: Row(children: const <Widget>[
          Text(
            "มหาวิทยาลัยขอนแก่น",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Sarabun',
                color: Colors.green,
                fontSize: 30),
          ),
          Text(
            "มหาวิทยาลัยเชียงใหม่",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Sarabun',
                color: Colors.blue,
                fontSize: 30),
          )
      ]),
    ));
  }
}
