import 'package:flutter/material.dart';

import '../models.dart';


class FamilyMemberCard extends StatelessWidget {
  final FamilyMember member;

  const FamilyMemberCard({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 2,
      child: Container(
        height: 150,
        width: 400,
        child: Row(
          children: [
            Image.network(
              member.imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.title),
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      Icons.star,
                      color: starIndex < member.rating
                          ? Colors.orange
                          : Colors.grey,
                    );
                  }),
                ),
                Text(member.location),
                Text(member.addedSince),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
