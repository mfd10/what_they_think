import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_they_think/constants/background_color.dart';
import 'package:what_they_think/constants/button.dart';
import 'package:what_they_think/constants/texts.dart';
import 'package:what_they_think/screens/sig_up_page.dart';
import 'package:what_they_think/screens/user_profile.dart';
import 'package:what_they_think/services/auth.dart';
import 'package:what_they_think/users.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late List<User> users;
  bool _isVisible = false;

final TextEditingController _email = TextEditingController();
final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    AuthService _auth = AuthService();
    return Material(
      child: Container(
        decoration: BoxDecoration(gradient: backGroundGradient()),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/main_page.png',
                height: height * 0.4,
              ),
              const SizedBox(height: 20),
              textField(width * 0.8, 'user', 'Enter email', false, _email),
              const SizedBox(height: 10),
              Container(
                width: width * 0.8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal( left: Radius.zero, right: Radius.zero),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: TextFormField(
                    controller: _pass,
                    obscureText: _isVisible ? false : true,
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 18, 0),
                        child: Icon(Icons.lock, size: 30, color: Colors.black),
                      ),
                      hintText: 'Enter Password',
                      hintStyle: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.black26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => updateStatus(),
                        color: Colors.black,
                        icon: Icon(_isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 55),
              GestureDetector(
                onTap: () {
                  _auth.signIn(_email.text, _pass.text).then((value) =>Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Profile())) );
                },
                child:
                    Button(txt: 'Login',color: Colors.white,textColor: Colors.black,width: width * 0.8),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textNormal("Don't have an account?", 15, Colors.black,
                      FontWeight.w300, 0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const SignUp()));
                    },
                    child: textNormal(
                        "Go Sign Up!", 15, Colors.black, FontWeight.bold, 0),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
}
