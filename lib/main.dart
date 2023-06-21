import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MeatOrderingApp());
}


class MeatOrderingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meat Ordering App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  final List<String> meatImages = [
    'assets/images/market1.jpg',
    'assets/images/market4.jpg',
    'assets/images/market6.jpg',
    'assets/images/market7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meat Ordering App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: double.infinity,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                  ),
                  items: meatImages.map((image) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: Text(
                    'Visit our Butchery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Welcome to our Meat Ordering App!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                MeatCategories(),
                SizedBox(height: 20),
                Text(
                  'Featured Meat Products',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                // Display featured meat products with images and details
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the cart page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                  child: Text('View Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MeatCategories extends StatelessWidget {
  final List<String> categories = ['Beef', 'Chicken', 'Lamb'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: categories
          .map(
            (category) => GestureDetector(
              onTap: () {
                // Handle category selection
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MeatSelectionPage(category)),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  category,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class MeatSelectionPage extends StatelessWidget {
  final String category;

  MeatSelectionPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meat Selection - $category'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(8, (index) {
          return GestureDetector(
            onTap: () {
              // Handle meat item selection
              // Add the selected meat to the cart
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/market1.jpg',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Meat $index',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Price: \$10'),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset(
              'assets/images/market4.jpg',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            title: Text('Beef 0'),
            subtitle: Text('Price: \$10, Quantity: 1'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Remove the item from the cart
              },
            ),
          ),
          // Display other items in the cart with their details
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subtotal: \$10',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Delivery Fee: \$5',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Proceed to payment process
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
class FeaturedMeatProductsPage extends StatelessWidget {
  final List<FeaturedMeatProduct> featuredMeatProducts = [
    FeaturedMeatProduct(
      image: 'assets/images/market1.jpg',
      title: 'Premium Beef Steak',
      price: '\$15.99',
    ),
    FeaturedMeatProduct(
      image: 'assets/images/market4.jpg',
      title: 'Grilled Chicken Breast',
      price: '\$9.99',
    ),
    FeaturedMeatProduct(
      image: 'assets/images/market7.jpg',
      title: 'Tender Lamb Chops',
      price: '\$12.99',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Meat Products'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Featured Meat Products',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: featuredMeatProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FeaturedMeatProductCard(featuredMeatProducts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedMeatProduct {
  final String image;
  final String title;
  final String price;

  FeaturedMeatProduct({
    required this.image,
    required this.title,
    required this.price,
  });
}

class FeaturedMeatProductCard extends StatelessWidget {
  final FeaturedMeatProduct product;

  FeaturedMeatProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
            ),
            child: Image.asset(
              product.image,
              height: 180.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  'Price: ${product.price}',
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle adding the product to the cart
              },
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
