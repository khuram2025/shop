import 'package:flutter/material.dart';
import 'package:untitled4/models.dart';


class ProductListCard extends StatelessWidget {
  final Product product;

  const ProductListCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 2,
      child: Container(
        height: 150,
        width: 400,
        child: Row(
          children: [
            Image.network(
              product.imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title),
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      Icons.star,
                      color: starIndex < product.rating
                          ? Colors.orange
                          : Colors.grey,
                    );
                  }),
                ),
                Text(product.location),
                Text(product.addedSince),
              ],
            ),
          ],
        ),
      ),
    );
  }
}