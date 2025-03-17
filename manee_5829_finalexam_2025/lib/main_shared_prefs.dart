import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Favorite Books App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List<String> favoriteBooks = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteBooks();
  }

  void _loadFavoriteBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteBooks = prefs.getStringList('favoriteBooks') ?? [];
    });
  }

  void _saveFavoriteBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favoriteBooks', favoriteBooks);
  }

  void _addFavoriteBook(String book) {
    setState(() {
      favoriteBooks.add(book);
      _saveFavoriteBooks();
    });
  }

  void _removeFavoriteBook(String book) {
    setState(() {
      favoriteBooks.remove(book);
      _saveFavoriteBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Books')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter book name'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _addFavoriteBook(_controller.text);
              _controller.clear();
            },
            child: const Text('Add to Favorites'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteBooks[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _removeFavoriteBook(favoriteBooks[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
