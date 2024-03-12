import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// ChangeNotifier class to manage state
class MyModel with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // Notify listeners about the change
  }

  void reset() {
    _counter = 0;
    notifyListeners(); // Notify listeners about the change
  }
}

// Main widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: MyHomePage(),
    );
  }
}

// Home page widget
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter =
        Provider.of<MyModel>(context); // access the Counter instance

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Provider Demo'),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Text('Counter: ${counter.counter}',
                      style: const TextStyle(
                          decoration: TextDecoration.none, fontSize: 40)),
                  ElevatedButton(
                    onPressed: () => counter.increment(),
                    child: const Text('Increment',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            color: Colors.blueAccent)),
                  ),
                  ElevatedButton(
                    onPressed: () => counter.reset(),
                    child: const Text('Reset',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            color: Colors.orange)),
                  ),
                ]))));
  }
}
