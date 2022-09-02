import 'package:flutter/material.dart';
import 'main.dart';

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
      flex: 3,
      child: Container(
        alignment: Alignment.bottomLeft,
        child: const Text(
          "Account registration",
          style: TextStyle(color: Colors.white, fontSize: 37),
        ),
      ),
    );
  }

  Expanded _getInputs() {
    return Expanded(
      flex: 4,
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
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          labelText: name,
          labelStyle: const TextStyle(color: Colors.white)),
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

class BackgroundSignUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sw = size.width;
    double sh = size.height;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.65);
    blueWave.cubicTo(sw * 0.8, sh * 0.8, sw * 0.5, sh * 0.8, sw * 0.45, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Colors.blue.shade300;
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.3);
    greyWave.cubicTo(
        sw * 0.65, sh * 0.45, sw * 0.65, sh * 0.25, sw * 0.35, sh * 0.5);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);

    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.6, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    paint.color = Colors.orange.shade300;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
