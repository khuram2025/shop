import 'package:flutter/material.dart';

import '../appBar.dart';

class FinancePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
        drawer: //... your drawer code here
        body: Center(child: Text('Main Page Content')),
    );
  }

}