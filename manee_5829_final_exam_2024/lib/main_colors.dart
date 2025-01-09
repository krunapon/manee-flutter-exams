import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteColorProvider extends ChangeNotifier {
  Color _favoriteColor = Colors.blue;

  Color get favoriteColor => _favoriteColor;

  void setFavoriteColor(Color newColor) {
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
        title: 'Favorite Color Provider Demo',
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
      appBar: AppBar(
        title: const Text('Favorite Color Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displays a Container with the favorite color
            Container(
              width: 200,
              height: 200,
              color: favoriteColorProvider.favoriteColor,
            ),
            const SizedBox(height: 20),
            // Row with buttons to change favorite color
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      favoriteColorProvider.setFavoriteColor(Colors.red),
                  child: const Text('Red'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () =>
                      favoriteColorProvider.setFavoriteColor(Colors.green),
                  child: const Text('Green'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () =>
                      favoriteColorProvider.setFavoriteColor(Colors.yellow),
                  child: const Text('Yellow'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
