import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isImageVisible = false;

  void toggleImageVisibility() {
    setState(() {
      isImageVisible = !isImageVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Show/Hide Image App'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: toggleImageVisibility,
              child: Text(
                isImageVisible ? 'Hide' : 'Show',
                style: const TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: isImageVisible,
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              child: Image.asset(
                'assets/kku.jpg', // Replace with your image path
                width: 200,
                height: 200,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
