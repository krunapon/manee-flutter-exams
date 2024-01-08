import 'package:flutter/material.dart';

class LocalImageApp extends StatelessWidget {
  const LocalImageApp({Key? key}) : super(key: key);

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
                const Center(
                    child: Image(
                      image: AssetImage("images/kktemple.jpg"),
                      width:300, height:200
                  )
                )
            )
    );
  }
}
