import 'package:flutter/material.dart';

import '../background/signin.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    _getHeader(),
                    _getInputs(),
                    _getSignIn(),
                    _getBottomRow()
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Expanded _getHeader() {
    return Expanded(
      flex: 4,
      child: Container(
        alignment: Alignment.bottomLeft,
        child: const Text("Welcome",
            style: TextStyle(color: Colors.white, fontSize: 37)),
      ),
    );
  }

  Expanded _getInputs() {
    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
            cursorColor: Colors.black,
            decoration: _decor('Email'),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            cursorColor: Colors.black,
            decoration: _decor('Password'),
          )
        ],
      ),
    );
  }

  InputDecoration _decor(String lable) {
    return InputDecoration(
      labelText: lable,
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      floatingLabelStyle: const TextStyle(
        color: Colors.black,
      ),
    );
  }

  Expanded _getSignIn() {
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Log in",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()));
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              radius: 40,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded _getBottomRow() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()));
            },
            child: const Text(
              "Registration",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline),
            ),
          ),
          const Text(
            "Forget password?",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}
