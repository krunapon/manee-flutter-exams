import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final TextInputType inputType;
  final Icon icon;

  const AppTextField({Key? key, required this.title,
    required this.inputType, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: title,
          icon: icon,
        ),
      ),
    );
  }
}