import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what_they_think/constants/background_color.dart';
import 'package:what_they_think/constants/button.dart';
import 'package:what_they_think/constants/texts.dart';
import 'package:what_they_think/screens/login_page.dart';
import 'package:what_they_think/screens/sig_up_page.dart';

import '../users.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<User> users = [];
  User user = User("", "", "");
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: backGroundGradient(),
        ),
        child: SafeArea(
          child: Column(children: [
            SizedBox(
              height: height * 0.1,
            ),
            Center(
              child:
                  textNormal('WHAT THEY THINK', 30, color1, FontWeight.bold, 1),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Image.asset(
              'assets/main_page.png',
            ),
            SizedBox(
              height: height * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const Login()));
              },
              child: buttons('LOGIN', Colors.white, color1, width * 0.75),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const SignUp()));
              },
              child: buttons('SIGN UP', color1, Colors.white, width * 0.75),
            ),
          ]),
        ),
      ),
    );
  }
}
