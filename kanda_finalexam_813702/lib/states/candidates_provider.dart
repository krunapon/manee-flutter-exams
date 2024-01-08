import 'package:flutter/material.dart';

class CandidateInfoProvider extends ChangeNotifier {
  String? _numberStr = "";
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
    _numberStr = data[name]!['number'];
    _imgFile = data[name]!['imgFile'];
    notifyListeners();
  }

  void reset() {
    _name = null;
    _numberStr = null;
    _imgFile = null;
    notifyListeners();
  }
  String? get numberStr => _numberStr;

  String? get imgFile => _imgFile;

  String? get name => _name;
}