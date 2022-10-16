import 'package:flutter/material.dart';
import 'package:sign_in_application/background/signup.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignUp(),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => goBack(),
              child: Container(
                padding: const EdgeInsets.only(left: 25, top: 35),
                child: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(children: [
                _getHeader(),
                _getInputs(),
                _getSignUp(),
                _getBottomRow()
              ]),
            )
          ],
        ),
      ),
    );
  }

  Expanded _getHeader() {
    return Expanded(
      flex: 5,
      child: Container(
        alignment: Alignment.centerLeft,
        child: const Text(
          "Account registration",
          style: TextStyle(color: Colors.white, fontSize: 37),
        ),
      ),
    );
  }

  Expanded _getInputs() {
    return Expanded(
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getTextField("Name"),
          const SizedBox(
            height: 15,
          ),
          _getTextField("E-mail"),
          const SizedBox(
            height: 15,
          ),
          _getTextField("Password"),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  TextField _getTextField(String name) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: name,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Expanded _getSignUp() {
    return Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Registration",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              radius: 40,
              child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            )
          ],
        ));
  }

  Expanded _getBottomRow() {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => goBack(),
            child: const Text(
              "Log in",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  void goBack() {
    Navigator.pop(context);
  }
}
