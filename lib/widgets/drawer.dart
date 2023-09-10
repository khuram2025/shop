import 'package:flutter/material.dart';
import 'package:untitled4/screens/ExpensePage.dart';
import 'package:untitled4/screens/MilkingSummary.dart';
import 'package:http/http.dart' as http;


import '../screens/FinancePage.dart';
import '../screens/IncomePage.dart';
import '../screens/authetication/login.dart';
import '../services/SharedPreferences.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  bool isLoggedIn() {
    // Replace this with actual logic to check if the user is logged in
    return true; // For demonstration purposes, this always returns true.
  }

  Future<void> logoutUser(BuildContext context) async {
    final url = 'http://10.30.0.76/accounts/api/logout/';

    try {
      final response = await http.post(Uri.parse(url)); // Assuming you have imported the http package

      if (response.statusCode == 200) {
        // Remove the token from SharedPreferences and navigate to login screen
        await AuthService.removeTokenFromPrefs();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error logging out')),
        );
      }
    } catch (error) {
      print('Error making the request: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: $error')),
      );
    }
  }


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
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(isLoggedIn() ? Icons.logout : Icons.login),
                title: Text(isLoggedIn() ? 'Logout' : 'Login'),
                onTap: () {
                  if (isLoggedIn()) {
                    logoutUser(context); // Calling the logout function
                  } else {
                    // Navigate to the login page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                },
              ),

            ),
          ),

        ],
      ),
    );
  }
}
