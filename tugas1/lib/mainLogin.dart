import 'package:flutter/material.dart';
import 'package:tugas1/auth_page.dart';
import 'package:tugas1/home.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Mainlogin extends StatelessWidget {
  const Mainlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}