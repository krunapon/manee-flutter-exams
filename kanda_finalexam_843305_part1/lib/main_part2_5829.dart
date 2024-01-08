import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Kanda Final Exam Part 2',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanda Final Exam Part 2'),
      ),
      body: const Center(
        child: SelectionButton(),
      )
    );
  }
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: const Text('Click Next!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the
  // result from Navigator.pop
  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  final String _nameId = "Manee 642-28-5829";
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send your name and ID'),
      ),
      body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, _nameId);
                },
                child: Text(_nameId),
              )
            ),
      );
  }
}

