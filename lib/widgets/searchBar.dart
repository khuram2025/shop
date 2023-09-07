import 'package:flutter/material.dart';


class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for products...',
            prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }
}
