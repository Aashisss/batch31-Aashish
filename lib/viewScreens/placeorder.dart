import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buy Now Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const BuyNowPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BuyNowPage extends StatefulWidget {
  const BuyNowPage({super.key});

  @override
  _BuyNowPageState createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  // Product details
  String productName = 'Bithday Cake';
  String productDescription = 'Come and make your day with having best cake availabe in our store.';
  double productPrice = 1200;

  // Size options
  List<String> sizeOptions = ['Small', 'Medium', 'Large'];
  String selectedSize = 'Medium';

  // User's name
  TextEditingController nameController = TextEditingController();

  // Quantity
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Now Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Navigate back when the back arrow is pressed
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product Image (you can use an actual image here)
              Image.network(
                'https://e7.pngegg.com/pngimages/795/603/png-clipart-t-shirt-gildan-activewear-navy-blue-t-shirt-tshirt-blue-thumbnail.png',
                height: 150,
              ),
              const SizedBox(height: 16),
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '\$$productPrice', // Display the product price
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                productDescription,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Size dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Select Size: '),
                  DropdownButton<String>(
                    value: selectedSize,
                    onChanged: (String? newSize) {
                      setState(() {
                        selectedSize = newSize!;
                      });
                    },
                    items: sizeOptions.map((String size) {
                      return DropdownMenuItem<String>(
                        value: size,
                        child: Text(size),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // User's name text field
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  hintText: 'Enter your name',
                ),
              ),
              const SizedBox(height: 16),
              // Quantity input
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Quantity: '),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        quantity = quantity > 1 ? quantity - 1 : 1;
                      });
                    },
                  ),
                  Text('$quantity'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Buy Now button
                  ElevatedButton(
                    onPressed: () {
                      // Handle the buy now action
                      // Navigate to the "Place Order" page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaceOrderPage(
                            productName: productName,
                            productPrice: productPrice,
                            selectedSize: selectedSize,
                            userName: nameController.text,
                            quantity: quantity,
                          ),
                        ),
                      );
                    },
                    child: const Text('Buy Now'),
                  ),
                  const SizedBox(width: 16),
                  // Add to Cart button
                  ElevatedButton(
                    onPressed: () {
                      // Handle the add to cart action
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product added to cart!'),
                        ),
                      );
                    },
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceOrderPage extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String selectedSize;
  final String userName;
  final int quantity;

  const PlaceOrderPage({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.selectedSize,
    required this.userName,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Order'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Order Summary:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text('Product: $productName'),
              Text('Size: $selectedSize'),
              Text('Quantity: $quantity'),
              Text('Price: \$$productPrice'),
              const SizedBox(height: 16),
              // Additional details (Address, Delivery Charges, Email, Billing Information, etc.)
              // Replace the placeholders with actual text fields or appropriate widgets
              const TextField(
                decoration: InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(labelText: 'Delivery Charges'),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(labelText: 'Billing Information'),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Handle the place order action (e.g., initiate payment)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order Placed Successfully!'),
                    ),
                  );
                },
                child: const Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
