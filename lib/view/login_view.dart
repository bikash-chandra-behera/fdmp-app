import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          controller: _email,
          decoration:
              InputDecoration(border: OutlineInputBorder(), labelText: 'Email'),
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
                  .signInWithEmailAndPassword(email: email, password: pass);
            } on FirebaseAuthException catch (e) {
              if (e.code == "invalid-email") {
                print("Invalid Email");
              }
              if (e.code == "user-not-found") {
                print("User Not Found or the user may have been deleted");
              }
              if (e.code == "wrong-password") {
                print("Wrong Password");
              }

              // print(e.runtimeType);
              // print(e.code);
            }
          },
          child: const Text("Login"),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/register/", (route) => false);
            },
            child: Text("Not Rsister yet? Register here!"))
      ]),
    );
  }
}
