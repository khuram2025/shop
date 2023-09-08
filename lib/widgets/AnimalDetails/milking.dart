import 'package:flutter/material.dart';


Widget buildMilkingTabContent(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("Add Milking"),
              onPressed: () {
                // Handle add milking button press
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Theme.of(context).primaryColor),
            onPressed: () {
              _showFilterOptions(context);
            },
          ),
        ],
      ),
      Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(right: 8.0), // Added right padding
          child: buildMilkingTable(context),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1000'),
            Text('3000'),
            Text('1000'),
            Text('5000'),
          ],
        ),
      ),
    ],
  );
}

void _showFilterOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Last 7 Days'),
            onTap: () {
              // Handle filter by last 7 days
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('This Month'),
            onTap: () {
              // Handle filter by this month
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Last Month'),
            onTap: () {
              // Handle filter by last month
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('1 Year'),
            onTap: () {
              // Handle filter by 1 year
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Custom Date'),
            onTap: () {
              // Handle custom date filter
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

Widget buildMilkingTable(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return DataTable(
    columnSpacing: 10, // Adjusted column spacing
    columns: [
      DataColumn(label: Container(width: width * 0.18, child: Text('Date'))),
      DataColumn(label: Container(width: width * 0.18, child: Text('1st'))),
      DataColumn(label: Container(width: width * 0.18, child: Text('2nd'))),
      DataColumn(label: Container(width: width * 0.18, child: Text('3rd'))),
      DataColumn(label: Container(width: width * 0.18, child: Text('Total'))),
    ],
    rows: List.generate(
      20, // For demonstration, generates 20 rows
          (index) => DataRow(cells: [
        DataCell(Text('01-01-2023')),
        DataCell(Text('500')),
        DataCell(Text('600')),
        DataCell(Text('400 ')),
        DataCell(Text('1500')),
      ]),
    ),
  );
}
