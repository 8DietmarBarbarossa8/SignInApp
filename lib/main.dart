import 'package:flutter/material.dart';

main() => runApp(const LogInApp());

class LogInApp extends StatelessWidget {
  const LogInApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

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
      flex: 2,
      child: Container(
        alignment: Alignment.bottomLeft,
        child: const Text("Welcome",
            style: TextStyle(color: Colors.white, fontSize: 37)),
      ),
    );
  }

  Expanded _getInputs() {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          TextField(
            decoration: InputDecoration(labelText: "Email"),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Password"),
          )
        ],
      ),
    );
  }

  Expanded _getSignIn() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Log in",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: 40,
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
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
        children: const [
          Text(
            "Registration",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline),
          ),
          Text(
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

class BackgroundSignIn extends CustomPainter {
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
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = Colors.blue.shade300;
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.1);
    greyWave.cubicTo(
        sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.52, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
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
