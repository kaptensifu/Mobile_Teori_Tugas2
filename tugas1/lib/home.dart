import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas1/mainLogin.dart'; // Pastikan import ke mainLogin agar kembali ke LoginPage
import 'package:tugas1/hitung.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent, title: Center(child: const Text('Home Page'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Home Page!',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            MaterialButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Mainlogin()),
                );
              },
              color: Colors.red,
              child: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HitungPage()),
                );
              },
              color: Colors.blue,
              child: const Text("Masuk ke Fitur"),
            ),
          ],
        ),
      ),
    );
  }
}
