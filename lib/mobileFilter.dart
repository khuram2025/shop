
import 'package:flutter/material.dart';
import 'package:untitled4/models.dart';

void _showFilterOptions(BuildContext context) {
  List<String> selectedCategories = [];
  final List<String> categories = AppData.categories;
  RangeValues priceRange = RangeValues(0, 500); // Example price range
  double selectedRating = 0;

  TextEditingController minPriceController = TextEditingController(text: '0');
  TextEditingController maxPriceController = TextEditingController(text: '500');

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,  // Add this line
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
          height: MediaQuery.of(context).size.height * 0.75, // Use 75% of screen height
          color: Colors.white,
          child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
                Text(
                  "Filters",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[700]),
                ),
                SizedBox(height: 16),
                Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  height: 100,
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(categories[index]),
                        value: selectedCategories.contains(categories[index]),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              selectedCategories.add(categories[index]);
                            } else {
                              selectedCategories.remove(categories[index]);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text('Price Range', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: minPriceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Min'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: maxPriceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Max'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                RangeSlider(
                  values: priceRange,
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      priceRange = newRange;
                      minPriceController.text = newRange.start.toStringAsFixed(2);
                      maxPriceController.text = newRange.end.toStringAsFixed(2);
                    });
                  },
                  min: 0,
                  max: 500,
                  divisions: 5,
                  labels: RangeLabels(
                    '\$${priceRange.start.toStringAsFixed(2)}',
                    '\$${priceRange.end.toStringAsFixed(2)}',
                  ),
                ),
                SizedBox(height: 16),
                Text('Rating', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Column(
                  children: List.generate(5, (index) {
                    return ListTile(
                      title: Text('${5 - index} stars & up'),
                      leading: Radio(
                        value: 5 - index,
                        groupValue: selectedRating,
                        onChanged: (double? value) {
                          setState(() {
                            selectedRating = value!;
                          });
                        },
                      ),
                    );
                  }),
                ),
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
