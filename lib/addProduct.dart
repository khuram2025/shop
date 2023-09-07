import 'dart:io';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController sellerNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Product Title'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.add_a_photo),
              label: Text("Add Images"),
              onPressed: () async {
                // Handle image selection and add to images list
                // For now, this is a placeholder. You might use image_picker or other plugins.
              },
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: images.map((file) {
                return Image.file(
                  file,
                  width: (MediaQuery.of(context).size.width - 32) / 3,
                  height: 100,
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: sellerNameController,
              decoration: InputDecoration(labelText: 'Seller Name'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                // You can either print the values or send them to a server.
                print(titleController.text);
                print(descriptionController.text);
                print(priceController.text);
                print(sellerNameController.text);
                print(cityController.text);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: AddProductPage(),
    ),
  );
}
