import 'package:flutter/material.dart';
import 'package:untitled4/models.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the primary color from the theme
    Color primaryColor = Theme.of(context).primaryColor;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: AppData.categories.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2.0, // optional: give some elevation to the card
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon for the category, you can replace this with a suitable icon
              Icon(Icons.category, color: primaryColor, size: 40.0),
              SizedBox(height: 5),
              Text(
                AppData.categories[index],
                textAlign: TextAlign.center,
                style: TextStyle(color: primaryColor),
              ),
            ],
          ),
        );
      },
    );
  }
}
