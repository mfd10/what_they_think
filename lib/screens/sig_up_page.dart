import 'package:flutter/material.dart';
import 'package:what_they_think/constants/background_color.dart';
import 'package:what_they_think/constants/button.dart';
import 'package:what_they_think/constants/texts.dart';
import 'package:what_they_think/screens/login_page.dart';
import 'package:what_they_think/screens/user_profile.dart';
import 'package:what_they_think/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
  final TextEditingController _email =TextEditingController();
  final TextEditingController _pass =TextEditingController();
  final TextEditingController _pass2 =TextEditingController();
  final TextEditingController _username =TextEditingController();

  final AuthService _authService = AuthService();



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        decoration: BoxDecoration(gradient: backGroundGradient()),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              textSignUp(width * 0.8, 'Enter Name', false,_username),
              const SizedBox(height: 5),
              textSignUp(width * 0.8, 'Enter E-Mail', false,_email),
              const SizedBox(height: 5),
              textSignUp(width * 0.8, 'Enter Password', true,_pass),
              const SizedBox(height: 5),
              textSignUp(width * 0.8, 'Enter Password Again', true,_pass2),
              const SizedBox(height: 55),
              GestureDetector(
                  onTap: (){
                    _authService.registerUser(_username.text, _email.text, _pass.text).then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Profile()));
                    });

                  },
                  child: Button(txt: 'Sign Up ', color: color2,textColor: Colors.white,width: width * 0.8)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textNormal("Already have an account?", 15, Colors.black,
                      FontWeight.w300, 0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));

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

  /*buildNameField() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: TextFormField(
            autocorrect: false,
            obscureText: false,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter User Name',
                hintStyle: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                  fontSize: 13,
                  color: Colors.black26,
                  fontWeight: FontWeight.w600,
                ))),
            onSaved: (value1) {
              setState(() {
                users.name = value1!;
              });
            },
          ),
        ),
      ),
    );
  }*/
}
