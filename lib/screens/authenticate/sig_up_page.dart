import 'package:flutter/material.dart';
import 'package:what_they_think/shared/background_color.dart';
import 'package:what_they_think/shared/button.dart';
import 'package:what_they_think/shared/loading.dart';
import 'package:what_they_think/shared/texts.dart';

import 'package:what_they_think/screens/authenticate/login_page.dart';
import 'package:what_they_think/screens/home/user_profile.dart';
import 'package:what_they_think/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _pass2 = TextEditingController();
  final TextEditingController _username = TextEditingController();

  final AuthService _authService = AuthService();
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return loading ?const Loading() : Material(
      child: Container(
        decoration: BoxDecoration(gradient: backGroundGradient()),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              textSignUp(width * 0.8, 'Enter Name', false, _username),
              const SizedBox(height: 5),
              textSignUp(width * 0.8, 'Enter E-Mail', false, _email),
              const SizedBox(height: 5),
              textSignUp(width * 0.8, 'Enter Password', true, _pass),
              const SizedBox(height: 5),
              textSignUp(width * 0.8, 'Enter Password Again', true, _pass2),
              const SizedBox(height: 55),
              GestureDetector(
                  onTap: () async {
                      setState(() {
                        loading=true;
                      });
                    dynamic result = await _authService
                        .registerUser(_username.text, _email.text, _pass.text)
                        .then((value) {
                      if (value != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Profile()));
                      }
                    });
                    if(result ==null){
                      setState(() {
                        loading=false;
                        print("couldn't sign in");
                      });
                    }
                  },
                  child: Button(
                      txt: 'Sign Up ',
                      color: color2,
                      textColor: Colors.white,
                      width: width * 0.8)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textNormal("Already have an account?", 15, Colors.black,
                      FontWeight.w300, 0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Login()));
                    },
                    child: textNormal(
                        "Login!", 15, Colors.black, FontWeight.bold, 0),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}
