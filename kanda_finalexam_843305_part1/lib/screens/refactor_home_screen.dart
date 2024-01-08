import 'package:flutter/material.dart';
import 'app_text_field.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextField(
            title: 'Enter your name',
            inputType: TextInputType.text,
            icon: const Icon(Icons.person_pin),
          ),
          AppTextField(
            title: 'Enter your name',
            inputType: TextInputType.text,
            icon: const Icon(Icons.email),
          ),
          AppTextField(
            title: 'Enter your name',
            inputType: TextInputType.text,
            icon: const Icon(Icons.phone),
          ),
        ],
      ),
    );
  }
}
