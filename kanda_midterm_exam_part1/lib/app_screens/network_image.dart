import 'package:flutter/material.dart';

class ImageApp extends StatelessWidget {
  const ImageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Container(
                padding: const EdgeInsets.only(left:10, right:10),
                child: Image.network("https://picsum.photos/250?image=9")
                  )
            )
        );
  }
}
