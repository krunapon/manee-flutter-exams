import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.only(top:20, bottom: 20),
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('The Biggest Philanthropist of All Time',
            style:TextStyle(
              fontSize:23,
              color: Colors.red
              )
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: Image.network('https://y4p4e3d2.rocketcdn.me/wp-content/uploads/2016/08/biggest-philanthropist-ever-400x274.jpg',
                    width:80,
                    height:80)),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                      child:const Text('Andrew Carnegie',
                        style: TextStyle(
                        fontSize:15,
                        color: Colors.blue,
                      )
                    )
                  )
                ),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                          child: const Text('\$297.8 billion',
                            style:TextStyle(fontSize:15,
                            color: Colors.green
                          )
                      )
                  )
                )
              ]
              )
            ),
          ]
        ),
      ),
    );
  }
}
