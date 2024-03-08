import 'package:flutter/material.dart';

class Philanthropist extends StatelessWidget {
  final String name;
  final String imgURL;
  final String donation;

  const Philanthropist(
      {Key? key,
      required this.name,
      required this.imgURL,
      required this.donation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(child: Image.network(imgURL, width: 100, height: 100)),
              Expanded(
                  child: Text(name,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ))),
              Expanded(
                  child: Text(donation,
                      style:
                          const TextStyle(fontSize: 15, color: Colors.green))),
            ]));
  }
}
