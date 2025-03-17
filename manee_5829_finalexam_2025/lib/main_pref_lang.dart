import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isEnglish = true;

  @override
  void initState() {
    super.initState();
    // Load the language preference when the app starts
    _loadLanguagePreference();
  }

  // Function to load language preference from SharedPreferences
  Future<void> _loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isEnglish = prefs.getBool('isEnglish') ?? true;
    });
  }

  // Function to toggle and save language preference
  Future<void> _toggleLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isEnglish = !_isEnglish;
      prefs.setBool('isEnglish', _isEnglish);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _isEnglish ? 'Language Preference' : 'การตั้งค่าภาษา',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_isEnglish ? 'Language Preference' : 'การตั้งค่าภาษา'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _isEnglish ? 'Current Language: English' : 'ภาษาปัจจุบัน: ไทย',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleLanguage,
                child: Text(
                  _isEnglish ? 'Switch to Thai' : 'เปลี่ยนเป็นภาษาอังกฤษ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
