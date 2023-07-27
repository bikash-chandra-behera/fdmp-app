import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rgistation")),
      body: FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Email'),
                  ),
                  TextField(
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'password'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final pass = _password.text;
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: pass);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "invalid-email") {
                          print("Invalid Email");
                        }
                        if (e.code == "user-not-found") {
                          print(
                              "User Not Found or the user may have been deleted");
                        }
                        if (e.code == "wrong-password") {
                          print("Wrong Password");
                        }

                        // print(e.runtimeType);
                        // print(e.code);
                      }
                    },
                    child: const Text("Login"),
                  )
                ]);

              default:
                return const Text("Loading");
            }
          }),
    );
  }
}
