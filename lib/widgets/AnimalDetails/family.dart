import 'package:flutter/material.dart';

import '../../models.dart';
import '../FamilyMemeberCard.dart';


Widget buildFamilyTabContent(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text("Add Family"),
            onPressed: () {
              // Handle add family button press
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Father', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        FamilyMemberCard(member: FamilyMember(
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Father\'s Name',
          rating: 4,
          location: 'Location',
          addedSince: 'Added since',
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Mother', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        FamilyMemberCard(member: FamilyMember(
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Mother\'s Name',
          rating: 4,
          location: 'Location',
          addedSince: 'Added since',
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Siblings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        // For demonstration, adding 3 sibling cards
        FamilyMemberCard(member: FamilyMember(
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Sibling 1',
          rating: 4,
          location: 'Location',
          addedSince: 'Added since',
        )),
        FamilyMemberCard(member: FamilyMember(
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Sibling 2',
          rating: 4,
          location: 'Location',
          addedSince: 'Added since',
        )),
        FamilyMemberCard(member: FamilyMember(
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Sibling 3',
          rating: 4,
          location: 'Location',
          addedSince: 'Added since',
        )),
      ],
    ),
  );
}
