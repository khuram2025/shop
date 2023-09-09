import 'package:flutter/material.dart';

import '../appBar.dart';
import '../widgets/drawer.dart';

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Sample Data for Categories and Transactions
  List<String> categories = ['Expense Category 01', 'Expense Category 02'];
  String selectedCategory = ''; // Empty means all categories are selected

  List<Map<String, dynamic>> transactions = [
    {'date': '2023-09-07', 'amount': 659.00, 'description': 'Example Description here', 'category': 'Expense Category 01'},
    {'date': '2023-09-06', 'amount': 859.00, 'description': 'Another Example', 'category': 'Expense Category 02'},
    // ... Add more transactions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey, title: "Expense Page"),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expense',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red[100], // light red color
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rs. 25698.00',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_downward, color: Colors.red),
                      SizedBox(width: 4),
                      Text('16% than last month'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expense Breakdown',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add Expense Category'),
                ),
              ],
            ),
            ...categories.map((category) => ListTile(
              title: Text(category),
              trailing: Text('Rs. ${(transactions.where((t) => t['category'] == category).fold(0.0, (prev, element) => prev + (element['amount'] as num))).toInt()}'),
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
              },
            )).toList(),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add Expense'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.where((t) => selectedCategory.isEmpty || t['category'] == selectedCategory).length,
                itemBuilder: (context, index) {
                  final transaction = transactions.where((t) => selectedCategory.isEmpty || t['category'] == selectedCategory).toList()[index];
                  return ExpansionTile(
                    title: Text('Date: ${transaction['date']}'),
                    subtitle: Text('Amount: Rs. ${transaction['amount'].toString()}'),
                    children: [
                      ListTile(
                        title: Text('Description: ${transaction['description']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                // Edit Action
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Delete Action
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
