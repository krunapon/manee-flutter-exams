import 'package:flutter/material.dart';

class BasicAndText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("CoE KKU"),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                const Center(
                  child: Text(
                    "CoE KKU!!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green, fontSize: 30),
                  ),
                ),
                const Text("Khon Kaen"),
                Row(
                    children: const <Widget> [
                    Expanded(child: Text("Hello, CESCA#17 will be helding on 27-30 April, 2022")),
                    Expanded(child: Text("If interested, apply by 15 March, 2022"))
                  ]
                )
              ]
          ),
        ));
  }
}
