import 'package:flutter/material.dart';
import 'package:kanda_finalexam_part3/models/memes.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.meme}) : super(key: key);

  final Meme meme;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _favorited = false;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 80,maxHeight: 80,
            minWidth: 100, maxWidth: 100),
            child: Image.network(widget.meme.url)
    ),
    title: Text(widget.meme.name),
    trailing: Icon(
      _favorited ? Icons.favorite : Icons.favorite_border,
      color: _favorited ? Colors.red : null
    ),
    onTap: () {
        setState(() {
          _favorited = !_favorited;
        });
    });
  }
}