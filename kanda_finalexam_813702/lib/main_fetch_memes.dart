import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kanda_finalexam_part3/app_screens/memes_listtile.dart';
import 'package:http/http.dart' as http;
import 'package:kanda_finalexam_part3/models/memes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Final Exam Part 3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Meme> _memesList = [];

  void getData() async {
    var url = Uri.parse('https://api.imgflip.com/get_memes');
    http.Response response = await http.get(url);
    setState(() {
      _memesList = Memes.fromJson(json.decode(response.body)).memes;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: ListView.builder(
            itemCount: _memesList.length,
            itemBuilder: (context, index) => ListItem(meme:_memesList[index]),
          )),
    );
  }
}