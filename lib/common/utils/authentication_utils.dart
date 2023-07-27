import 'package:flutter/material.dart';

class AuthenticationUtils {
  static bool isLoggedIn = false;

  // Simulate a login request with username and password
  static Future<bool> loginUser(String username, String password) async {
    // In a real app, this function would make an API call to authenticate the user
    // For the sake of example, we'll assume the login is successful if the username is "demo" and the password is "password"
    await Future.delayed(Duration(seconds: 2)); // Simulate API delay

    if (username == "demo" && password == "password") {
      isLoggedIn = true;
      return true;
    } else {
      isLoggedIn = false;
      return false;
    }
  }

  // Logout the user
  static void logoutUser() {
    isLoggedIn = false;
  }
}
