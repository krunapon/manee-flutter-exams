import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final int productId;

  ProductDetailPage({required this.productId});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // Mock product data - in a real app, you would fetch this based on the productId
  Map<int, Map<String, dynamic>> productDetails = {
    1: {
      'name': 'Product 1',
      'description': 'This is the detailed description for Product 1.',
      'price': 99.99,
      'imageUrl':
          'https://down-th.img.susercontent.com/file/th-11134211-7r98t-ln60oacj6ob729.webp',
    },
    2: {
      'name': 'Product 2',
      'description': 'Product 2 offers advanced features and premium quality.',
      'price': 149.99,
      'imageUrl':
          'https://down-th.img.susercontent.com/file/th-11134211-7r992-ln60oacjaw0j32.webp',
    },
  };

  @override
  Widget build(BuildContext context) {
    // Get the product details using the productId
    final product = productDetails[widget.productId];

    // Handle case where product is not found
    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Product Not Found')),
        body: Center(child: Text('The requested product could not be found.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.network(
                product['imageUrl'],
                height: 200,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(Icons.image_not_supported, size: 50),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Product Name
            Text(
              product['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Product Price
            Text(
              '\$${product['price']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 20),

            // Product Description
            Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(product['description'], style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
