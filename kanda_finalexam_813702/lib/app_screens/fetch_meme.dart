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

class FetchMeme extends StatefulWidget {
  const FetchMeme({Key? key}) : super(key: key);

  @override
  _FetchMemeState createState() => _FetchMemeState();
}

class _FetchMemeState extends State<FetchMeme> {
  late Future<Meme> futureMeme;

  @override
  void initState() {
    super.initState();
    futureMeme = fetchMeme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Final Exam Part 3 by 642-28-5829'),
        ),
        body: Center(
          child: FutureBuilder<Meme>(
            future: futureMeme,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text(snapshot.data!.name,
                          style:const TextStyle(fontSize: 18, color: Colors.pink)),
                      const SizedBox(height:18),
                      Image.network(snapshot.data!.url,
                          width: 200, height: 200, fit: BoxFit.contain)
              ]
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
    );
  }
}