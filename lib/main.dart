import 'package:fdmp_app/firebase_options.dart';

// import 'package:fdmp_app/services/user_management.dart';
import 'package:fdmp_app/view/login_view.dart';
import 'package:fdmp_app/view/register_view.dart';
import 'package:fdmp_app/view/verify_email_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
      }));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              print(user);
              if (user != null) {
                if (user.emailVerified) {
                  print("email is verifyed");
                } else {
                  return VerifyEmailView();
                }
              } else {
                return LoginView();
              }
              return Text("done");
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
