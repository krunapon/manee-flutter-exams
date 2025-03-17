import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Layout',
      home: Scaffold(
        body: ResponsiveLayout(
          child1: Text('Khon Kaen University', style: TextStyle(fontSize: 20)),
          child2: Text('Chiang Mai University', style: TextStyle(fontSize: 20)),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget child1, child2;

  const ResponsiveLayout({Key? key, required this.child1, required this.child2})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.landscape
            ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [child1, SizedBox(width: 16), child2],
              ),
            )
            : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [child1, SizedBox(height: 16), child2],
              ),
            );
      },
    );
  }
}
