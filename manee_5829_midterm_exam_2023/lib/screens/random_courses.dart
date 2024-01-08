import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';


int next(int min, int max) {
  final _random = Random();
  return (min + _random.nextInt(max - min));
}
var min = 100000;
var max = 200000;
var numItems = 20;
List<String> getListElements() {
  var items = List<String>.generate(
      numItems, (counter) => "EN${next(min, max)}: ${WordPair.random()}");
  return items;
}

class RandomCourses extends StatefulWidget {
  const RandomCourses({Key? key}) : super(key: key);

  @override
  _RandomCoursesState createState() => _RandomCoursesState();
}

class _RandomCoursesState extends State<RandomCourses> {
  final _saved = <String>{};
  void alertMsg(BuildContext context, Text content) {
    var alertDialog = AlertDialog(
        title: const Text("Selected random course"), content: content);

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  String getRandomWord(String words) {
    final splits = words.split(':');
    return splits[0].trim();
  }

  void showAlertMsg(BuildContext context, String words, Color color) {
    alertMsg(
        context,
        Text(getRandomWord(words),
            style: TextStyle(fontSize: 18, color: color)));
  }

  Widget getListView() {
    var listItems = getListElements();

    var listView = ListView.builder(
        itemCount: numItems,
        itemBuilder: (context, index) {
          String words = listItems[index];

          if (index % 2 == 0) {
            return ListTile(
                textColor: Colors.pink,
                title: Text(listItems[index],
                    style: const TextStyle(fontSize: 26)),
                onTap: () {
                  String selectedWord = getRandomWord(words);
                  bool alreadySaved = _saved.contains(selectedWord);
                  debugPrint("selected course is $selectedWord");
                  setState(() {
                    if (alreadySaved) {
                      _saved.remove(selectedWord);
                    } else {
                      _saved.add(selectedWord);
                    }
                    debugPrint("saved list is $_saved.toString()");
                    showAlertMsg(context, words, Colors.pink);
                  });
                });
          } else {
            return ListTile(
              textColor: Colors.green,
              title:
                  Text(listItems[index], style: const TextStyle(fontSize: 26)),
              onTap: () {
                String selectedWord = getRandomWord(words);
                bool alreadySaved = _saved.contains(selectedWord);
                debugPrint("selected course is $selectedWord");
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(selectedWord);
                  } else {
                    _saved.add(selectedWord);
                  }
                  debugPrint(_saved.toString());
                  showAlertMsg(context, words, Colors.green);
                });
              },
            );
          }
        });

    return listView;
  }

  void _displaySelected() {
    var listView = ListView.builder(
        itemCount: _saved.length,
        itemBuilder: (context, index) {
          return ListTile(
              textColor: Colors.pink,
              title: Text(_saved.toList()[index]),
              onTap: () {});
        });
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Selected Courses'),
          ),
          body: listView);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Widgets Exercise",
        // home: SnackBarDemo()
        home: Scaffold(
            appBar: AppBar(title: const Text("Random Courses"), actions: [
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: _displaySelected,
                tooltip: 'Display selected courses',
              )
            ]),
            body: getListView()));
  }
}
