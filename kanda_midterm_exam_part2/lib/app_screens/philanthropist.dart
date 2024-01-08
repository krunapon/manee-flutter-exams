import 'package:flutter/material.dart';

class Philanthropist extends StatelessWidget {
  final String name;
  final String imgURL;
  final String donation;

  const Philanthropist({Key? key,
    required this.name, required this.imgURL, required this.donation}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  child: Image.network(imgURL,
                      width:80,
                      height:80)),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child:Text(name,
                          style: const TextStyle(
                            fontSize:15,
                            color: Colors.blue,
                          )
                      )
                  )
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(donation,
                          style:const TextStyle(fontSize:15,
                              color: Colors.green
                          )
                      )
                  )
              ),
            ]
        )
    );
  }
}