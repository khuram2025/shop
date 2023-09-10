import 'package:flutter/material.dart';
import 'package:untitled4/bottomBar.dart';
import 'package:untitled4/homePage.dart';
import 'package:untitled4/productList.dart';

import 'screens/authetication/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      // home: MainScreen(),
        home: LoginScreen(),

    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final _navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _navigatorKeys[_currentIndex]!.currentState!.maybePop(),
      child: Scaffold(
        body: Stack(
          children: _buildNavigationStack(),
        ),
        bottomNavigationBar: CustomBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == _currentIndex) {
              _navigatorKeys[index]!.currentState!.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                _currentIndex = index;
              });
            }
          },
        ),
      ),
    );
  }

  List<Widget> _buildNavigationStack() {
    return [
      _buildOffstageNavigator(0, HomePage()),
      _buildOffstageNavigator(1, ProductListView()),
      _buildOffstageNavigator(2, Text('Shops Page')), // Replace with your Shops Page
      _buildOffstageNavigator(3, Text('Settings Page')), // Replace with your Settings Page
    ];
  }

  Widget _buildOffstageNavigator(int index, Widget page) {
    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => page,
          );
        },
      ),
    );
  }
}
