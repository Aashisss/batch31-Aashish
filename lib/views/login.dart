import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../app/routes/app_routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
function

class _LoginState extends State<Login> {
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
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            const SizedBox(height: 60),
            InputStyle("Username", "Enter your username"),
            const SizedBox(height: 20),
            InputStyle("Password", "Enter your password"),
            const SizedBox(height: 60),
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.dashboardRoute);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  TextSpan(
                    text: "Register",
                    style: TextStyle(
                        fontSize: 15, color: Colors.orangeAccent[700]),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, AppRoute.registerRoute);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget InputStyle(String title, String hintTxt) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title:",
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 10),
              hintText: hintTxt,
            ),
          ),
        ),
      ],
    ),
  );
}
