import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:what_they_think/models/custom_user.dart';
import 'package:what_they_think/screens/authenticate/welcome_page.dart';
import 'package:what_they_think/screens/home/user_profile.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customUser = Provider.of<CustomUser?>(context);
    return customUser == null ? const WelcomePage() : const Profile();
  }
}
