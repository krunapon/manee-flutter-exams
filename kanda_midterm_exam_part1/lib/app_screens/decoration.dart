import 'package:flutter/material.dart';

class DecorationBox extends StatelessWidget {
  const DecorationBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = 'Local Images';

    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body:
                Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.yellow)
                      ,
                      child: const Image(
                        image: AssetImage("images/kktemple.jpg"),
                        width:300, height:200)
                      )
                )
          )
            );
  }
}
