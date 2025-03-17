import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteColorProvider extends ChangeNotifier {
  String _favoriteColor = "Blue";
  String get favoriteColor => _favoriteColor;

  void setFavoriteColor(String newColor) {
    _favoriteColor = newColor;
    notifyListeners();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteColorProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favorite Color Provider',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteColorProvider = Provider.of<FavoriteColorProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Color Changer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displays a Container with the favorite color
            SizedBox(
              width: 200,
              height: 200,
              child: Text(
                favoriteColorProvider.favoriteColor,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // Row with buttons to change favorite color
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:
                      () => favoriteColorProvider.setFavoriteColor("Red"),
                  child: const Text('Red', style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed:
                      () => favoriteColorProvider.setFavoriteColor("Green"),
                  child: const Text('Green', style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed:
                      () => favoriteColorProvider.setFavoriteColor("Blue"),
                  child: const Text('Blue', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
