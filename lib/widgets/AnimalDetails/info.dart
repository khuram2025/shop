import 'package:flutter/material.dart';


Widget buildInfoTabContent() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Table(
      columnWidths: {
        0: FlexColumnWidth(2), // gives more width to the first column
        1: FlexColumnWidth(3),
      },
      border: TableBorder.all(color: Colors.grey[300]!),
      children: [
        _buildTableRow("Tag#", "CF101"),
        _buildTableRow("Sex", "Male"),
        _buildTableRow("Age", "2 Years 3 Months 4 Days"),
        _buildTableRow("Category", "Cow"),
        _buildTableRow("Status", "Milking Since 2 Months 3 Days"),
      ],
    ),
  );
}

TableRow _buildTableRow(String label, String value) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(value),
      ),
    ],
  );
}
