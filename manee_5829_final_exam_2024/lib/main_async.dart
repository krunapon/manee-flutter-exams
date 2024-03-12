import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*void fetchData() {
  Future<String> futureData = fetchDataFromApi();
  futureData.then((ipString) {
    var ipJson = jsonDecode(ipString);
    String ip = ipJson['ip'];
    debugPrint('Your public IP address is $ip');
  }).catchError((error) {
    debugPrint('Error: $error');
  });
}*/

Future<String> fetchDataFromApi() async {
  try {
    final response =
        await http.get(Uri.parse('http://api.ipify.org?format=json'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load IP address');
    }
  } catch (e) {
    throw Exception('Failed to connect to the API: $e');
  }
}

Future<void> fetchData() async {
  String ipString = await fetchDataFromApi();
  var ipJson = jsonDecode(ipString);
  String ip = ipJson['ip'];
  debugPrint("Your public IP address is $ip");
}

void main() {
  fetchData();
}
