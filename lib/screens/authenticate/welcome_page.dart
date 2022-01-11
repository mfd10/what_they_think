import 'package:flutter/material.dart';
import 'package:what_they_think/shared/background_color.dart';
import 'package:what_they_think/shared/button.dart';
import 'package:what_they_think/shared/texts.dart';
import 'package:what_they_think/screens/authenticate/login_page.dart';
import 'package:what_they_think/screens/authenticate/sig_up_page.dart';

import '../../models/custom_user.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<CustomUser> users = [];
  //User user = User("", "", "");
  toLogin(BuildContext context) {}

  toSignUp(BuildContext context) {}
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Login()));
                },
                child: Button(
                    txt: 'LOGIN',
                    color: Colors.white,
                    textColor: color1,
                    width: width * 0.75)),
            const SizedBox(height: 30),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SignUp()));
                },
                child: Button(
                    txt: 'SIGN UP',
                    color: color1,
                    textColor: Colors.white,
                    width: width * 0.75)),
          ]),
        ),
      ),
    );
  }
}
