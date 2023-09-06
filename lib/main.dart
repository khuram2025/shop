import 'package:flutter/material.dart';
import 'package:untitled4/bottomBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      home: ProductListView(),
    );
  }
}

class ProductListView extends StatefulWidget {
  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Product> products = List.generate(
    10,
        (index) => Product(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Title Of the Product $index',
      rating: 4,
      location: 'Location $index',
      addedSince: 'Two months 3 days',
    ),
  );

  final List<String> categories = [
    'Electronics',
    'Fashion',
    'Home',
    'Beauty',
    'Sports',
    'Toys',
    'Automotive',
    'Grocery',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List View')),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10), // Add this padding
                    child: Container(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          Color borderColor = Colors.green[400]!;
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: borderColor),
                            ),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: TextStyle(color: borderColor),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        _showFilterOptions(context);
                      },
                      child: Text('Filter'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[400],
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      ),
                    )

                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(product: products[index]),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    elevation: 2,
                    child: Container(
                      height: 150,
                      width: 400,
                      child: Row(
                        children: [
                          Image.network(
                            products[index].imageUrl,
                            width: 150,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[index].title),
                              Row(
                                children: List.generate(5, (starIndex) {
                                  return Icon(
                                    Icons.star,
                                    color: starIndex < products[index].rating
                                        ? Colors.orange
                                        : Colors.grey,
                                  );
                                }),
                              ),
                              Text(products[index].location),
                              Text(products[index].addedSince),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}


class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.imageUrl,
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 24),
                Icon(Icons.star, color: Colors.yellow, size: 24),
                Icon(Icons.star, color: Colors.yellow, size: 24),
                Icon(Icons.star, color: Colors.yellow, size: 24),
                Icon(Icons.star_border, color: Colors.grey, size: 24),
                SizedBox(width: 10),
                Text('(24 reviews)'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'This is a detailed description of the product. Here you can provide more comprehensive information about the product\'s features, uses, and any other relevant details.',
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String imageUrl;
  final String title;
  final int rating;
  final String location;
  final String addedSince;

  Product({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.location,
    required this.addedSince,
  });
}

void _showFilterOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        height: 500,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                // Handle option 1 tap
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Handle option 2 tap
              },
            ),
            // Add more options as needed
          ],
        ),
      );
    },
  );
}
