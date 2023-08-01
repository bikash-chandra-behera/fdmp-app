import 'package:fdmp_app/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as devtools show log;
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
        title: const Text("Login"),
      ),
      body: Column(children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          controller: _email,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Email'),
        ),
        TextField(
          obscureText: true,
          controller: _password,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'password'),
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final pass = _password.text;
            try {
              final userCredential = await FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: email, password: pass);
              Navigator.of(context).pushNamedAndRemoveUntil(
                noteRoute,
                (route) => false,
              );
              devtools.log(userCredential.toString());
            } on FirebaseAuthException catch (e) {
              if (e.code == "invalid-email") {
                devtools.log("invalid email");
              }
              if (e.code == "user-not-found") {
                devtools
                    .log("User Not Found or the user may have been deleted");
              }
              if (e.code == "wrong-password") {
                devtools.log("Wrong Password");
              }

              // print(e.runtimeType);
              devtools.log(e.code);
            }
          },
          child: const Text("Login"),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: const Text("Not registered yet? Register here!"))
      ]),
    );
  }
}
