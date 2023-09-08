import 'package:flutter/material.dart';
import 'package:untitled4/widgets/AnimalDetails/family.dart';

import '../widgets/AnimalDetails/info.dart';
import '../widgets/AnimalDetails/milking.dart';
import '../widgets/AnimalDetails/weight.dart';

class AnimalDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 4,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://via.placeholder.com/400',  // Replace with your image URL
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            'Title of Animal',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              TabBar(
                indicatorColor: Theme.of(context).primaryColor, // Indicator color
                labelColor: Theme.of(context).primaryColor,     // Color of selected tab text
                unselectedLabelColor: Colors.grey,              // Color of unselected tab text
                tabs: [
                  Tab(text: 'Info'),
                  Tab(text: 'Weight'),
                  Tab(text: 'Milking'),
                  Tab(text: 'Breeding'),
                  Tab(text: 'Family'),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    buildInfoTabContent(),
                    buildWeightTabContent(context),
                    buildMilkingTabContent(context),

                    Center(child: Text('Breeding Content')),
                    buildFamilyTabContent(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: AnimalDetailPage(),
    ),
  );
}


