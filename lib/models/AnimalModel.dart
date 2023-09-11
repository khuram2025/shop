import 'package:http/http.dart' as http;
import 'dart:convert';

import '../services/SharedPreferences.dart'; // for JSON decoding


class Animal {
  final String imageUrl;
  final String tag;
  final double purchaseCost;
  final String sex;
  final String animalType;
  final String status;

  Animal({
    required this.imageUrl,
    required this.tag,
    required this.purchaseCost,
    required this.sex,
    required this.animalType,
    required this.status,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      imageUrl: json['image'],
      tag: json['tag'],
      purchaseCost: json['purchase_cost'].toDouble(),
      sex: json['sex'],
      animalType: json['animal_type'],
      status: json['status'],
    );
  }
}



class ApiService {
  final String baseUrl;


  ApiService(this.baseUrl);

  Future<List<Animal>> fetchAnimals() async {
    // Fetch the token dynamically
    final token = await AuthService.getTokenFromPrefs();
    if (token == null) {
      throw Exception('Token not found');
    }

    final headers = {
      'Authorization': 'Token $token',
    };

    final response = await http.get(Uri.parse('$baseUrl/your_endpoint_here'), headers: headers);

    if (response.statusCode == 200) {
      List animalsJson = json.decode(response.body);
      return animalsJson.map((animal) => Animal.fromJson(animal)).toList();
    } else {
      throw Exception('Failed to load animals');
    }
  }

}
