import 'package:flutter/material.dart';
import 'package:what_they_think/shared/background_color.dart';
import 'package:what_they_think/shared/button.dart';
import 'package:what_they_think/screens/authenticate/welcome_page.dart';
import 'package:what_they_think/services/auth.dart';
import '../../models/custom_user.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}
class _SettingState extends State<Setting> {

  final AuthService _authService =AuthService();

  @override
  Widget build(BuildContext context) {
    signOut() async{
      await _authService.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>const WelcomePage()));
    }
    var formKey = GlobalKey<FormState>();
    CustomUser users = CustomUser (name: "",eMail: "",password: "",uid: "");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade800,
        title: const Center(child: Text('Settings')),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: backGroundGradient()),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan.shade800,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Material(
                      child: Container(
                        decoration:
                            BoxDecoration(gradient: backGroundGradient()),
                        child: SafeArea(
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset('assets/try1.jpeg',
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    height: MediaQuery.of(context).size.height *
                                        0.5),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hoverColor: Colors.cyan.shade800,
                                      fillColor: Colors.cyan.shade800,
                                      labelText: "User Name",
                                      labelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      hintText: "New User Name"),
                                  onSaved: (value1) {
                                    users.name =
                                        value1!; //TODO change the value with users  info
                                  },
                                ),

                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.cyan.shade800,
                                    ),
                                    child: const Text("Save"),
                                    onPressed: () {
                                      print(users.name);
                                    }),

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ));
              },
              child: const ListTile(
                  leading: Icon(
                    Icons.drive_file_rename_outline,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Change User name',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  )),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan.shade800,
              ),
              onPressed: () {},
              child: const ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Change Password',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  )),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan.shade800,
              ),
              onPressed: () {},
              child: const ListTile(
                  leading: Icon(
                    Icons.add_a_photo_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Change Profile Photo',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  )),

            ),
            Button(
                color: Colors.white,
                width: 200,
                txt: "Sign out",
                textColor: Colors.red,function: signOut),
          ],
        ),
      ),
    );
    ;
  }
  //

  /* Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content:
        Text("Would you like to change your user name ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );*/
}
