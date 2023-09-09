import 'package:flutter/material.dart';
import 'package:untitled4/screens/ExpensePage.dart';
import 'package:untitled4/screens/MilkingSummary.dart';

import '../screens/FinancePage.dart';
import '../screens/IncomePage.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    "U",
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                  radius: 50.0,
                ),
                SizedBox(height: 10.0),
                Text("Username", style: TextStyle(fontSize: 16.0)),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.eco),
            title: Text('My Farm'),
            onTap: () {
              // Navigate to My Farm Page
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Finances'),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Summry'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FinanceDashboard()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Income'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => IncomePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Expense'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ExpensePage()),
                  );
                },
              ),

            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Milking'),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Summry'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MilkSummary()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Income'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => IncomePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Expense'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ExpensePage()),
                  );
                },
              ),

            ],
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Employees'),
            onTap: () {
              // Navigate to Employees Page
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.insert_chart),
            title: Text('Reports'),
            onTap: () {
              // Navigate to Reports Page
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to Settings Page
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
