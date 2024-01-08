import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class CoursesDisplay extends StatefulWidget {
  const CoursesDisplay({Key? key}) : super(key: key);

  @override
  _CoursesDisplayState createState() => _CoursesDisplayState();
}

class _CoursesDisplayState extends State<CoursesDisplay> {

  Widget _getRandomWord() {
      return Container(
              padding: const EdgeInsets.all(10),
              child: Text("${WordPair.random()}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, color: Colors.deepPurple)));

  }
  void _displayRandomWord() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context)
    {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Random Word of the Day'),
          ),
          body:
              Center(
              child: Column(
                  children:
                  <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top:220, bottom:10),
                      child:const Text("Random Word of the Day",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, color: Colors.deepOrange))),
                    _getRandomWord()
                  ])));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "DME Courses",
        // home: SnackBarDemo()
        home: Scaffold(
            appBar: AppBar(title: const Text("DME Courses"), actions: [
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: _displayRandomWord,
                tooltip: 'Display random word',
              )
            ]),
            body:
                const CourseListView()
                ));
  }
}

class CourseListView extends StatelessWidget {
  const CourseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      ListTile(
          title: const Text('Object Oriented Programming'
              , style: TextStyle(fontSize:24, color: Colors.orange)),
          leading: const Icon(Icons.arrow_right),
          trailing: const Icon(Icons.star),
          onTap: () => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("EN842004")))),
      ListTile(
          title: const Text('Interactive Web Programming',
              style: TextStyle(fontSize:24)),
          leading: const Icon(Icons.arrow_right),
          onTap: () => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("EN842300")))),
      ListTile(
          title: const Text('Mobile App Development',
              style: TextStyle(fontSize:24, color: Colors.orange)),
          leading: const Icon(Icons.arrow_right),
          trailing: const Icon(Icons.star),
          onTap: () => ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("EN843305"))))
    ],
    );
  }
}

