import 'package:flutter/material.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(80, 80),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 230,
                    ),
                  ),
                  const Text(
                    "Register",
                    style: TextStyle(fontSize: 35, color: Colors.black),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InputStyle("Username", "test@gmail.com"),
            InputStyle("Password", "abcd1234"),
            InputStyle("Confirm Password", "abcd1234"),
            InputStyle("Location", "Nepal"),
            InputStyle("Identification Number", "N-14444"),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Back to Login",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
