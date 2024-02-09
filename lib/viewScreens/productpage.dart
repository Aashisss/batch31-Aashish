import 'package:flutter/material.dart';
import 'package:hive_and_api_for_class/features/home/presentation/view/bottom_view/dashboard_view.dart';

void main() {
  runApp(const DashboardView());
}

class Product {
  final String name;
  final String description;

  Product(this.name, this.description);
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // children: <Widget>[
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              product.description,
              //style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement the logic to add the product to the cart
               // print('Product added to the cart: ${product.name}');

                // Close the current screen and return to the previous screen
                Navigator.pop(context);
              },
              child: const Text('Add to Cart'),
            ),
        ),
      ),
    );
  }
}
