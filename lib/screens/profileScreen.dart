import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('User Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('path_to_image'), // Change to your image path
            ),
            SizedBox(height: 20),
            Text('user@example.com'),  // Replace with actual data
            Text('+123 456 7890'),     // Replace with actual data
            Text('123 Street, City, Country'), // Replace with actual data
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab('My Ads', 0),
                _buildTab('Favorites', 1),
                _buildTab('Settings', 2),
              ],
            ),
            Expanded(child: _buildTabContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontWeight: _selectedTabIndex == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return ListView(
          children: [
            // List of user's ads
          ],
        );
      case 1:
        return ListView(
          children: [
            // List of user's favorites
          ],
        );
      case 2:
        return ListView(
          children: [
            // Settings list
          ],
        );
      default:
        return Container();
    }
  }
}

void main() => runApp(MaterialApp(home: ProfileScreen()));
