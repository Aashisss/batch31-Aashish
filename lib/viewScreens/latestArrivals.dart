import 'package:flutter/material.dart';

// Model class for product details
class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class LatestArrivalsScreen extends StatelessWidget {
  LatestArrivalsScreen({Key? key}) : super(key: key);

  // Dummy product data
  final List<Product> products = [
    Product(
      name: 'jens',
      imageUrl:
          'https://e7.pngegg.com/pngimages/64/922/png-clipart-jeans-t-shirt-clothing-graphy-a-pile-of-folded-jeans-blue-white-thumbnail.png',
      price: 99.99,
    ),
    Product(
      name: 'shirt',
      imageUrl:
          'https://png.pngtree.com/png-clipart/20211203/ourmid/pngtree-formal-shirt-free-png-and-psd-png-image_4047424.png',
      price: 700,
    ),
    Product(
      name: 'vest',
      imageUrl:
          'https://png.pngtree.com/png-clipart/20221006/ourmid/pngtree-men-vest-png-image_6285896.png',
      price: 600,
    ),
    Product(
      name: 'pant',
      imageUrl:
          'https://w7.pngwing.com/pngs/63/280/png-transparent-jeans-denim-slim-fit-pants-bell-bottoms-jeans-blue-fashion-boy-thumbnail.png',
      price: 1000,
    ),
    Product(
      name: 't-shirt',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0bv0OV8NeupB6lMCy_YjUCqAm57lhbJjuwdQEgYp52Q&s',
      price: 800,
    ),
    Product(
      name: 'Black shirt',
      imageUrl:
          'https://img.freepik.com/free-psd/plain-black-tshirt-transparent-background_125540-4055.jpg',
      price: 500,
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Arrivals'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(product.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Discount: ${((product.price * 0.15)).toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart functionality
                      // You can implement this
                    },
                    child: Text('Add to Cart'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Buy now functionality
                      // You can implement this
                    },
                    child: Text('Buy Now'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LatestArrivalsScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
