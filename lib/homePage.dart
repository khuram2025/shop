import 'package:flutter/material.dart';
import 'package:untitled4/appBar.dart';
import 'package:untitled4/main.dart';
import 'package:untitled4/models.dart';
import 'package:untitled4/productList.dart';
import 'package:untitled4/widgets/banner.dart';
import 'package:untitled4/widgets/categgoryCard.dart';
import 'package:untitled4/widgets/productListCard.dart';
import 'package:untitled4/widgets/searchBar.dart';
// ... other imports ...

class HomePage extends StatelessWidget {
  final List<Product> products = List.generate(
    5,
        (index) => Product(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Title Of the Product $index',
      rating: 4,
      location: 'Location $index',
      addedSince: 'Two months 3 days',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBox(),
            BannerCard(),
            SizedBox(height:10),
            CategoryCard(),
            ...products.map((product) => ProductListCard(product: product)).toList(),
          ],
        ),
      ),
    );
  }






}

void main() => runApp(MaterialApp(home: HomePage()));
