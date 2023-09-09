import 'package:flutter/material.dart';

import '../appBar.dart';
import '../widgets/drawer.dart';

class FinanceDashboard extends StatefulWidget {
  @override
  _FinanceDashboardState createState() => _FinanceDashboardState();
}

class _FinanceDashboardState extends State<FinanceDashboard> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String filterValue = 'Month';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey, title: "HomePage"),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Finance Dashboard',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: filterValue,
                      items: ['Week', 'Month', 'Year'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          filterValue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Income', style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Rs. 25698.00',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Expense', style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Rs. 15698.00',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),


            SizedBox(height: 20),
            // Placeholder for the bar chart. Replace this with actual chart widget.
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(child: Text('Bar Chart Placeholder')),
            ),
            SizedBox(height: 20),
            Text(
              'Income Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Income Category 01'),
              trailing: Text('Rs. 10000'),
            ),
            ListTile(
              title: Text('Income Category 02'),
              trailing: Text('Rs. 15000'),
            ),
            SizedBox(height: 20),
            Text(
              'Expense Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Expense Category 01'),
              trailing: Text('Rs. 5000'),
            ),
            ListTile(
              title: Text('Expense Category 02'),
              trailing: Text('Rs. 10000'),
            ),
          ],
        ),
      ),
    );
  }
}
