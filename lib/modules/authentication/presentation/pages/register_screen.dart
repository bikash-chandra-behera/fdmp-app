import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fdmp_app/common/utils/api_utils.dart'; // Replace with the actual import path

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String phoneNumber = _phoneNumberController.text.trim();
                  if (phoneNumber.isNotEmpty) {
                    // Call the registerWithPhone method to register the user with the provided phone number
                    UserCredential? userCredential =
                        await APIUtils.registerWithPhone(phoneNumber);
                    if (userCredential != null) {
                      // Handle successful registration
                      print(
                          "User registered with phone number: ${userCredential.user?.uid}");
                    } else {
                      // Handle registration failure
                      print("Registration with phone number failed");
                    }
                  } else {
                    // Handle empty phone number field
                    print("Please enter a valid phone number");
                  }
                },
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
