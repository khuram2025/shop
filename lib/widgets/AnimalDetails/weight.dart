import 'package:flutter/material.dart';


Widget buildWeightTabContent(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Add Weight'),
          onPressed: () {
            // Handle adding weight here
          },
        ),
        SizedBox(height: 20),
        Container(
          height: 200, // Adjust as needed
          color: Theme.of(context).primaryColor.withOpacity(0.2), // Placeholder for the chart
          child: Center(child: Text('Weight Chart (Data and weight)')),
        ),
        SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1.5),
                3: FlexColumnWidth(1.5),
                4: FlexColumnWidth(1.5),
              },
              border: TableBorder.all(color: Colors.grey[300]!),
              children: [
                _buildWeightTableRow("Date", "Weight", "Weight Change", "%age Weight", "Per Day Weight Gain"),
                // Add your data rows here. For this example, I'll add a dummy row:
                _buildWeightTableRow("01/01/2023", "50kg", "+5kg", "10%", "1.5kg"),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

TableRow _buildWeightTableRow(String date, String weight, String weightChange, String percentageWeight, String perDayGain) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(date, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(weight),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(weightChange),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(percentageWeight),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(perDayGain),
      ),
    ],
  );
}
