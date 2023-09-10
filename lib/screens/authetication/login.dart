import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? mobileNumber;
  String? password;

  Future<void> _login() async {
    final url = 'http://10.30.0.76/accounts/api/login/';
    http.Response? response;

    // Printing the data that's about to be sent
    print('Sending data: mobile_number: $mobileNumber, password: $password');

    try {
      response = await http.post(
        Uri.parse(url),
        body: {
          'username': mobileNumber,  // Use 'username' here instead of 'mobile_number'
          'password': password,
        },
      );


      // Print the full response from the server
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

    } catch (error) {
      print('Error making the request: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: $error')),
      );
      return; // Exit early from the function if there's an error
    }

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];

      // TODO: Save the token securely
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful! Token: $token')),
      );
      // Navigate to MainScreen
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      final data = json.decode(response.body);
      final error = data['error'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Channab')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  mobileNumber = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _login();
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
