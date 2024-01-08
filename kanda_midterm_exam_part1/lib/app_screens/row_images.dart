import 'package:flutter/material.dart';

class BasicAndText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.orangeAccent,
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text("Khon Kaen"),
          ),
          body: Column(
              children: <Widget> [
                const Center(
                  child: Text(
                    "Khon Kaen temples",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green, fontSize: 30),
                  ),
                ),
                FittedBox(
                    child: Row(
                    children: const <Widget> [
                    Image(
                        image: AssetImage("images/kktemple.jpg"),
                        width:300, height:200),
                    Image(
                        image: AssetImage("images/kktemple.jpg"),
                        width:300, height:200)
                  ]
                )
                )]
          ),
        ));
  }
}
