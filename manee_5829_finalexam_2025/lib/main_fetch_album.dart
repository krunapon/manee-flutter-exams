import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      home: AlbumPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  String title = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  Future<void> fetchAlbum() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/'),
      );
      if (response.statusCode == 200) {
        final albumData = jsonDecode(response.body);
        setState(() {
          title = albumData['title'];
        });
      }
    } catch (e) {
      setState(() {
        title = "Error loading data";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calling Album API')),
      body: Center(child: Text(title, style: TextStyle(fontSize: 24))),
    );
  }
}
