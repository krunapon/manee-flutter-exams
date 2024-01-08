import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kanda_finalexam_part3/app_screens/memes_listtile.dart';
import 'package:http/http.dart' as http;
import 'package:kanda_finalexam_part3/models/memes.dart';


class FetchMemes extends StatefulWidget {
  FetchMemes({Key? key}) : super(key: key);


  @override
  _FetchMemesState createState() => _FetchMemesState();
}

class _FetchMemesState extends State<FetchMemes> {
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
        title: const Text('Final Exam Part 3 by 642-28-5829'),
      ),
      body: Container(
          child: ListView.builder(
            itemCount: _memesList.length,
            itemBuilder: (context, index) => ListItem(meme:_memesList[index]),
          )),
    );
  }
}