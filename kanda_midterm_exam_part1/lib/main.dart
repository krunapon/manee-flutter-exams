import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Itemcounter',
      home: Scaffold(
          appBar: AppBar(title: const Text('Sample StatefulWidget')),
          body: const Center(
            //margin: EdgeInsets.all(20),
            child: ItemCounter('john'),
          )),
    );
  }
}

class ItemCounter extends StatefulWidget {
  final String name;
  const ItemCounter(this.name);

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          count++;
        });
      },
      child: Container(
        color: Colors.orange,
        padding: const EdgeInsets.all(5),
        child: Text(
          count.toString(),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }
}
