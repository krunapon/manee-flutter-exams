import 'package:flutter/material.dart';
import 'package:kanda_finalexam_part3/models/memes.dart';

class ListItem extends StatelessWidget {
  final Meme meme;

  ListItem(this.meme);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: <Widget>[
            Container(
              height: 80,
              width: 100,
              child: Image.network(meme.url),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        meme.name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ]),
              ),
            ),
          ],
        ));
  }
}