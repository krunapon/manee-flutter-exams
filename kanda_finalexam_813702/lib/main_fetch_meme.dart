import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Meme> fetchMeme() async {
  final response = await http
      .get(Uri.parse('https://api.imgflip.com/get_memes'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Meme.fromJson(jsonDecode(response.body), 0);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Meme {
  final String name;
  final String url;

  const Meme({
    required this.name,
    required this.url
  });

  factory Meme.fromJson(Map<String, dynamic> json, int index) {
    return Meme(
      name: json['data']['memes'][index]['name'],
      url: json['data']['memes'][index]['url']
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Meme> futureMeme;

  @override
  void initState() {
    super.initState();
    futureMeme = fetchMeme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Exam Part 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Final Exam Part 3 by 642-28-5829'),
        ),
        body: Center(
          child: FutureBuilder<Meme>(
            future: futureMeme,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.name + " can be downloaded at " +
                          snapshot.data!.url);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}