import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what_they_think/constants/background_color.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: backGroundGradient()),
      child: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Title :"),
                  TextFormField(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
