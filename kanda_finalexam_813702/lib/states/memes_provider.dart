import 'package:flutter/material.dart';

class MemeInfoProvider extends ChangeNotifier {
  String? _imgFile = "images/blank.jpeg";
  String? _name = "";

  var data = {
    "chatchart" : {
      "number": "8",
      "imgFile":"images/chatchart.jpeg",
      "fullname":"Chatchart Sittiphan"
    },
    "wiroj" : {
      "number": "1",
      "fullname": "Wiroj Lakkhanaadisorn"
    }
  };

  void checkNumber(String name) {
    debugPrint("name is $name");
    _name = data[name]!['fullname'];
    _imgFile = data[name]!['imgFile'];
    notifyListeners();
  }

  void reset() {
    _name = null;
    _imgFile = null;
    notifyListeners();
  }

  String? get imgFile => _imgFile;

  String? get name => _name;
}