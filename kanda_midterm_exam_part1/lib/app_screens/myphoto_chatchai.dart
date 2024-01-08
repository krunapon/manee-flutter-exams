import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("https://upload.wikimedia.org/wikipedia/commons/4/46/Phra_Mahathat_Kaen_Nakhon_temple%2C_Khon_Kaen%2C_Thailand.jpg");
    Image image = Image(image: assetImage, width: 500, height: 400);
    return Expanded( 
      child: Container(
        child: image,
      )
    );
  }
}