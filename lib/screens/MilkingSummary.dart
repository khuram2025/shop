import 'package:flutter/material.dart';

import '../appBar.dart';
import '../widgets/drawer.dart';

class MilkSummary extends StatefulWidget {
  @override
  _MilkSummaryState createState() => _MilkSummaryState();
}

class _MilkSummaryState extends State<MilkSummary> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String filterValue = 'Month';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey, title: "HomePage"),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Milk Summary',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
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
                ],
              ),
              SizedBox(height: 20),
              // Placeholder for the pie chart
              Container(
                height: 200,
                color: Colors.grey[300],
                child: Center(child: Text('Pie Chart Placeholder')),
              ),
              SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 3,
                children: [
                  summaryBox('1st Time', '100 Ltr'),
                  summaryBox('2nd Time', '200 Ltr'),
                  summaryBox('3rd Time', '150 Ltr'),
                  summaryBox('Total', '350 Ltr'),
                ],
              ),
              SizedBox(height: 20),
              Text('Milk Status', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              dataTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget summaryBox(String title, String value) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45, // I've set this width to make sure it occupies almost half of the screen width minus some spacing.
      height: 60, // You can adjust this value to your preference.
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
          SizedBox(height: 2),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }



  Widget dataTable() {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
      },
      children: [
        tableRow('Total Milking Animal', '20'),
        tableRow('Farm Avg', '14.5'),
        tableRow('0-30 Days', '17.6 ltr Avg'),
        tableRow('30-90 Days', '18.6 ltr Avg'),
        tableRow('90-150 Days', '16.5 ltr Avg'),
        tableRow('150-365 Days', '10.5 ltr Avg'),
        tableRow('365-above', '9 ltr Avg'),
      ],
    );
  }

  TableRow tableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(label, style: TextStyle(fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
