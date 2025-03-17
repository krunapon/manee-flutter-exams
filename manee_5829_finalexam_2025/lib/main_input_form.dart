import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Example App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FormScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Form')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Name',
            hintText: 'Enter your name',
          ),
          onChanged: (value) {
            print('Current value: $value');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String name = _nameController.text;
          String msg = "";
          if (name.isEmpty) {
            msg = "Name cannot be empty";
          } else {
            msg = "Hello, $name!";
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg), duration: const Duration(seconds: 10)),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
