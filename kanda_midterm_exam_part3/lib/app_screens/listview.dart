import 'package:flutter/material.dart';
import 'person_image_asset.dart';

class BasicListView extends StatelessWidget {
  const BasicListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          const ListTile(title: Text('Andrew Carnegie'),
              leading: PersonImageAsset(imgName: "images/carnegie.jpg"),
              trailing: Icon(
                  Icons.favorite,
                  color: Colors.red
              )
          ),
          const ListTile(title: Text('Bill Gates'),
              leading: PersonImageAsset(imgName: "images/gates.jpg"),
              trailing: Icon(
                  Icons.favorite_border,
                  color: null
              )
          ),
          ListTile(title: const Text('Warren Buffet'),
              leading: const PersonImageAsset(imgName: "images/buffet.jpg"),
              onTap:() =>
                  ScaffoldMessenger.of(context).
                  showSnackBar(const SnackBar(content: Text("He is one of the greatest investors")))
          )
        ]
    );
  }
}






