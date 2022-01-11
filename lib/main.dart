import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_they_think/screens/authenticate/wrapper.dart';
import 'package:what_they_think/services/auth.dart';
import 'package:what_they_think/services/database.dart';


import 'models/custom_user.dart';
import 'models/post.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(

      providers: [
        StreamProvider<List<Post>?>.value(value: DatabaseService().getPosts, initialData: null),
        StreamProvider<CustomUser?>.value(value: AuthService().customUser, initialData: null,)
        
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Wrapper(),
    );
  }
}
