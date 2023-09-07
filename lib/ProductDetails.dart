import 'package:flutter/material.dart';
import 'package:untitled4/models.dart';
import 'package:untitled4/reviewFarm.dart';



class ProductDetailPage extends StatelessWidget {
  final Product product;
  final Review review;

  ProductDetailPage({required this.product, required this.review});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Image.network(
                  product.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                product.title,
                style: TextStyle(fontSize: 15.9, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.phone),
                    label: Text("Call"),
                    style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.message),
                    label: Text("Message"),
                    style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.chat),
                    label: Text("WhatsApp"),
                    style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Specifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text("Property")),
                  DataColumn(label: Text("Value"))
                ],
                rows: [
                  DataRow(cells: [DataCell(Text("Type")), DataCell(Text("Home"))]),
                  DataRow(cells: [DataCell(Text("Price")), DataCell(Text("PKR 1.63 Crore"))]),
                  DataRow(cells: [DataCell(Text("Location")), DataCell(Text("Lahore, Pakistan"))]),
                  DataRow(cells: [DataCell(Text("Area")), DataCell(Text("5.6 Marla"))]),
                  DataRow(cells: [DataCell(Text("Added")), DataCell(Text("34 minutes ago"))]),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Location',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150,
                color: Colors.grey,
                child: Center(child: Icon(Icons.location_on, color: Colors.blue, size: 50)),
              ),
              SizedBox(height: 20),
              Text(
                'Comments & Reviews',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              reviewWidget("User 1", "This is a great product!", 5),
              reviewWidget("User 2", "I loved it.", 4),
              reviewWidget("User 3", "It's worth every penny.", 3),

              SizedBox(height: 20),
              ReviewForm(
                onSubmit: (String comment, int rating) {
                  // Handle the comment and rating submission here
                  print('Comment: $comment');
                  print('Rating: $rating');
                  // You can store the comment and rating, send them to a server, etc.
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget reviewWidget(String username, String comment, int userRating) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
          Text('5 days ago', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(5, (starIndex) {
              return Icon(
                Icons.star,
                size: 18,  // Decreased size
                color: starIndex < userRating ? Colors.deepOrange : Colors.grey,
              );
            }),
          ),
          SizedBox(height: 5),
          Text(comment),
        ],
      ),
      leading: Icon(Icons.account_circle, size: 40),
    );
  }


}

void main() {
  runApp(MaterialApp(
    home: ProductDetailPage(
      product: Product(
        imageUrl: 'https://via.placeholder.com/150',
        title: 'Sample Product',
        rating: 4,
        location: 'Some Location',
        addedSince: 'Some Date',
      ),
      review: Review(
        imageUrl: 'https://via.placeholder.com/150',
        title: 'Sample Review',
        rating: 4,
      ),
    ),
  ));
}