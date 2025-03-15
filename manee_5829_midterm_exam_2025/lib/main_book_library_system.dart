import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final int year;

  const Book({
    required this.title,
    required this.author,
    required this.year,
  });
}

class BookLibraryScreen extends StatelessWidget {
  BookLibraryScreen({super.key});

  final List<Book> books = [
    Book(
      title: 'The Flutter Way',
      author: 'Sarah Code',
      year: 2024,
    ),
    Book(
      title: 'Dart Programming',
      author: 'John Developer',
      year: 2023,
    ),
  ];

  void _showBookSnackBar(BuildContext context, Book book) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected: ${book.title}'),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Library'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            leading: const Icon(Icons.book, size: 40),
            title: Text(
              book.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'By ${book.author} - ${book.year}',
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => _showBookSnackBar(context, book),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: BookLibraryScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}
