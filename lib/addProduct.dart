import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  final picker = ImagePicker(); // Add this

  Future<void> _getImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () async {
                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      images.add(File(pickedFile.path));
                    });
                  } else {
                    print('No image selected.');
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () async {
                  final pickedFile = await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      images.add(File(pickedFile.path));
                    });
                  } else {
                    print('No image selected.');
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }


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
              onPressed: _getImage, // Use the function we just created
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
