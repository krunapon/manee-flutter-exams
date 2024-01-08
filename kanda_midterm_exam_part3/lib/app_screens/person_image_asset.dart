import 'package:flutter/material.dart';

class PersonImageAsset extends StatelessWidget {
  final String imgName;
  const PersonImageAsset({Key? key, required this.imgName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(this.imgName);
    Image image = Image(image: assetImage, width:50, height: 50);
    return Container(child: image);
  }
}