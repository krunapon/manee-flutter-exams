import 'package:flutter/material.dart';
import 'package:manee_5829_finalexam_2025/product_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      // Define the initial route
      initialRoute: '/',
      // Set up named routes
      routes: {
        '/': (context) => HomePage(),
        '/products': (context) => ProductsPage(),
        // Product detail page needs parameters, so we use a different approach
        '/product': (context) => ProductDetailPage(productId: 0),
      },
      // Handle dynamic routes with parameters
      onGenerateRoute: (settings) {
        if (settings.name?.startsWith('/product/') ?? false) {
          // Extract the product ID from the route name
          final productId = int.parse(settings.name!.split('/')[2]);

          return MaterialPageRoute(
            builder: (context) => ProductDetailPage(productId: productId),
          );
        }
        // Return null to allow the routes table to resolve the route
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: Text('View Products'),
          onPressed: () {
            // Navigate to products page
            Navigator.pushNamed(context, '/products');
          },
        ),
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'id': 1, 'name': 'Product 1'},
    {'id': 2, 'name': 'Product 2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        // Add back button to return to previous screen
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['name']),
            onTap: () {
              // Navigate to product detail with product ID
              Navigator.pushNamed(context, '/product/${products[index]['id']}');
            },
          );
        },
      ),
    );
  }
}
