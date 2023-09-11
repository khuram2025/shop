import 'package:flutter/material.dart';

import '../models/AnimalModel.dart';

class AnimalsListPage extends StatefulWidget {
  @override
  _AnimalsListPageState createState() => _AnimalsListPageState();
}

class _AnimalsListPageState extends State<AnimalsListPage> {
  late Future<List<Animal>> animals;

  @override
  void initState() {
    super.initState();
    animals = ApiService('http://10.30.0.76/api/').fetchAnimals();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animals')),
      body: FutureBuilder<List<Animal>>(
        future: animals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Animal animal = snapshot.data![index];
                return ListTile(
                  leading: Image.network(animal.imageUrl),
                  title: Text(animal.tag),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price: ${animal.purchaseCost}'),
                      Text('Sex: ${animal.sex}'),
                      Text('Type: ${animal.animalType}'),
                      Text('Status: ${animal.status}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
