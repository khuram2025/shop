import 'package:flutter/material.dart';
import 'package:untitled4/ProductDetails.dart';
import 'package:untitled4/appBar.dart';
import 'package:untitled4/bottomBar.dart';
import 'package:untitled4/models.dart';
import 'package:untitled4/widgets/drawer.dart';
import 'package:untitled4/widgets/productListCard.dart';

class ProductListView extends StatefulWidget {
  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey, title: "Items List"),

      drawer: MainDrawer(),

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
                        builder: (context) => ProductDetailPage(
                          product: products[index],
                          review: Review(
                            imageUrl: 'https://via.placeholder.com/150',
                            title: 'Sample Review for ${products[index].title}',
                            rating: 4,
                          ), // This is a dummy review. Fetch the actual review if you have it.
                        ),
                      ),
                    );

                  },
                  child: ProductListCard(product: products[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}




void _showFilterOptions(BuildContext context) {
  List<String> selectedCategories = [];
  final List<String> categories = AppData.categories;

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: EdgeInsets.all(16.0),
            height: 500,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Text(
                  "Filters",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[700]),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text('Select Categories'),
                      isExpanded: true,
                      items: categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Row(
                            children: [
                              Checkbox(
                                value: selectedCategories.contains(category),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      selectedCategories.add(category);
                                    } else {
                                      selectedCategories.remove(category);
                                    }
                                  });
                                },
                              ),
                              Text(category),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // Do not change the state here as it's handled by the checkbox
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // ... (Rest of the widgets like price and ratings)
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle filter application
                  },
                  child: Text('Apply Filters'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
