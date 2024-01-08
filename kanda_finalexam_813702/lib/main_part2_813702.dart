import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home:Homepage()));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int _max = 3;
  final int _min = 0;
  int _counter = 0;
  late bool _isButtonIncrementDisabled;
  late bool _isButtonDecrementDisabled;
  late bool _isButtonIncrementPressed;
  late bool _isButtonDecrementPressed;


  void _initializeValues() {
    _isButtonIncrementDisabled = false;
    _isButtonDecrementDisabled = false;
    _isButtonIncrementPressed = false;
    _isButtonDecrementPressed = false;
    _counter = 0;
  }

  @override
  void initState() {
    super.initState();
    _initializeValues();
  }

  void _reset() {
    setState(() {
      _initializeValues();
    });
  }

  void _showDialog(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Out of bounds problem!"),
              content: Text('$msg'),
              actions: <Widget>[
                ElevatedButton(onPressed: () {Navigator.of(context).pop();}
                    , child: const Text("OK"))
              ]
          );
        }
    );
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _isButtonDecrementPressed = false;
      _isButtonIncrementPressed = true;
      if (_counter > _min) {
        _isButtonDecrementDisabled = false;
      }
    });
    debugPrint("disable button is $_isButtonIncrementDisabled increment counter is $_counter");
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
      _isButtonDecrementPressed = true;
      _isButtonIncrementPressed = false;
      if (_counter < _max) {
        _isButtonIncrementDisabled = false;
      }
    });
    debugPrint("disable button is $_isButtonDecrementDisabled decrement counter is $_counter");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                appBar: AppBar(
                  title: const Text('Kanda Final Exam Part 2'),
                ),
                body: Container(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                Image.asset('images/kanda1993.jpeg',
                                    width: 400,
                                    height: 150,
                                    fit: BoxFit.contain),
                                Container(
                                    margin: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      'By 642-28-5829',
                                      style: TextStyle(
                                          color: Colors.pink[500],
                                          fontSize: 22),
                                    )),
                              ])),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _isButtonIncrementPressed ? (_isButtonIncrementDisabled ? '$_max' : '$_counter') :
                                    (_isButtonDecrementDisabled ? '$_min' : '$_counter'),
                                    style: TextStyle(
                                        color: Colors.blue[500], fontSize: 60),
                                  ))),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        child: const Text("Decrement"),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.redAccent,
                                            onPrimary: Colors.white
                                        ),
                                        onPressed: () {
                                          _decrementCounter();
                                          if (_counter < _min) {
                                            _showDialog(context,
                                                "The minimum counter value is $_min");
                                            _isButtonDecrementDisabled = true;
                                          }
                                        },
                                      ),
                                      ElevatedButton(
                                        child: const Text("Reset"),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.pink,
                                            onPrimary: Colors.white
                                        ),
                                        onPressed: () {
                                          _reset();
                                        },
                                      ),
                                      ElevatedButton(
                                        child: const Text("Increment"),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green,
                                            onPrimary: Colors.white
                                        ),
                                        onPressed: () {
                                          _incrementCounter();
                                          if (_counter > _max) {
                                            _showDialog(context,
                                                "The maximum counter value is $_max");
                                            _isButtonIncrementDisabled = true;
                                          }
                                        },
                                      ),
                                    ],
                                  )))
                        ])));
  }
}
