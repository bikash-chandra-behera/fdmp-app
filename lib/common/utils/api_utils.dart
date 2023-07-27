import 'package:firebase_auth/firebase_auth.dart';

class APIUtils {
  // ... (previously defined methods)

  // Function to sign in user with phone number using Firebase Authentication
  static Future<UserCredential?> signInWithPhone(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification if the phone number is automatically verified
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(credential);
          // Handle the authenticated user, if needed
          print(
              "User signed in with phone number: ${userCredential.user?.uid}");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Phone verification failed: $e");
        },
        codeSent: (String verificationId, int? resendToken) {
          // Handle code sent to the provided phone number
          // You can show OTP screen and let the user enter the code
          // and call signInWithPhoneNumber with the entered code and verificationId
          // Example:
          // String smsCode = "123456";
          // signInWithPhoneNumber(verificationId, smsCode);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle the situation when the code is automatically verified
          // and the timeout has passed
        },
        timeout: Duration(seconds: 60),
      );

      return null; // Return null since the actual userCredential is obtained via callbacks.
    } catch (e) {
      print("Error signing in with phone number: $e");
      return null;
    }
  }

  // Function to register user with phone number using Firebase Authentication
  static Future<UserCredential?> registerWithPhone(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification if the phone number is automatically verified
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(credential);
          // Handle the authenticated user, if needed
          print(
              "User registered with phone number: ${userCredential.user?.uid}");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Phone verification failed: $e");
        },
        codeSent: (String verificationId, int? resendToken) {
          // Handle code sent to the provided phone number
          // You can show OTP screen and let the user enter the code
          // and call signInWithPhoneNumber with the entered code and verificationId
          // Example:
          // String smsCode = "123456";
          // signInWithPhoneNumber(verificationId, smsCode);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle the situation when the code is automatically verified
          // and the timeout has passed
        },
        timeout: Duration(seconds: 60),
      );

      return null; // Return null since the actual userCredential is obtained via callbacks.
    } catch (e) {
      print("Error registering with phone number: $e");
      return null;
    }
  }
}
