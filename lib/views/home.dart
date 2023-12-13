import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              TopNav(),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    "Categories",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryCard(
                          imageUrl: 'assets/images/shirt.png',
                          categoryName: 'shirt'),
                      CategoryCard(
                          imageUrl: 'assets/images/pant.png',
                          categoryName: 'pant'),
                      CategoryCard(
                          imageUrl: 'assets/images/jacket.png',
                          categoryName: 'jacket'),
                      CategoryCard(
                          imageUrl: 'assets/images/jens.png',
                          categoryName: 'jens'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    "Products",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.count(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    // Add ProductCard widgets here.
                    productCard(
                        imageUrl: 'assets/images/shirt.png',
                        productName: "shirt",
                        price: 400),
                    productCard(
                        imageUrl: 'assets/images/pant.png',
                        productName: "pant",
                        price: 500),
                    productCard(
                        imageUrl: 'assets/images/jacket.png',
                        productName: "jacket",
                        price: 300),
                    productCard(
                        imageUrl: 'assets/images/jens.png',
                        productName: "jens",
                        price: 600),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Header() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFFA6B1E1), // You can change the color as per your design
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text on the left side
          Align(
            alignment: Alignment.center,
            child: Text(
              'CLOTH-SHOP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Profile image icon on the right side
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/profiles.png'),
            // Replace 'assets/profile_icon.png' with your actual image asset path
          ),
        ],
      ),
    );
  }

  Widget TopNav() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 10),
      width: 380,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                  labelText: "search products",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  // // Updated CategoryCard widget
  Widget CategoryCard(
      {required String imageUrl, required String categoryName}) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageUrl), // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            categoryName,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  
  
  Widget productCard({
    required String imageUrl,
    required String productName,
    required double price,
    bool isLiked = false,
    int rating = 0,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Stack(
        children: [
          // Smaller centered image
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                height: 120, // Set the desired height for the smaller image
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'assets/images/splash.png',
                    height: 120,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            productName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Implement like button logic
                          },
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Text(
                      "Rs. $price", // Replace with actual price
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
