import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 4. Define the MyApp class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 1. First, define the CartItem class
class CartItem {
  final int id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  // Calculate the total price for this item
  double get total => price * quantity;
}

// 2. Create the CartProvider class
class CartProvider extends ChangeNotifier {
  // Map of cart items with product ID as the key
  Map<int, CartItem> _items = {};

  // Getter for cart items
  Map<int, CartItem> get items => {..._items};

  // Getter for total number of items in cart
  int get itemCount => _items.length;

  // Getter for total price of all items
  double get totalAmount {
    double total = 0;
    _items.forEach((key, item) {
      total += item.total;
    });
    return total;
  }

  // Add an item to the cart
  void addItem(int productId, String name, double price) {
    if (_items.containsKey(productId)) {
      // Increase quantity if item already exists
      _items[productId]!.quantity += 1;
    } else {
      // Add new item
      _items.putIfAbsent(
        productId,
        () => CartItem(id: productId, name: name, price: price),
      );
    }
    // Notify listeners about the change
    notifyListeners();
  }

  // Remove an item from the cart
  void removeItem(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  // Clear the cart
  void clear() {
    _items = {};
    notifyListeners();
  }
}

// 3. Main app with Provider
void main() {
  runApp(
    // Set up the provider at the top level
    ChangeNotifierProvider(create: (ctx) => CartProvider(), child: MyApp()),
  );
}

// 4. Example widget that uses the cart state
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the cart provider
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 20)),
                  Spacer(),
                  // Display the total amount
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
