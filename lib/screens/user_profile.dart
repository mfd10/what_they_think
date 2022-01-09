import 'package:flutter/material.dart';
import 'package:what_they_think/constants/background_color.dart';
import 'package:what_they_think/screens/posting_page.dart';
import 'package:what_they_think/screens/setting_page.dart';

import '../users.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //late File _image;

  User users = User("Ali", "", "");

  final FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;
  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  final double profileHeight = 140;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade800,
        title: const Center(child: Text('User Name')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Setting()));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: backGroundGradient()),
        child: Column(
          children: [
            Center(child: buildProfileImage()),
            buildContent(),
            buildFollowButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        Text('Number'),
                        Text('Post'),
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        Text('Number'),
                        Text('Follow'),
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        Text('Number'),
                        Text('Follower'),
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              color: Colors.green,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.05,
              child: const Center(child: Text('Posted Surveys')),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Post()));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              tooltip: "Go to Home Page",
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              tooltip: "Trending Survey",
              icon: const Icon(Icons.trending_up),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2.5,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const NetworkImage(
            'https://i.pinimg.com/564x/c1/cc/6c/c1cc6c4894e48c71e74d32e70d252625.jpg'),
      );

  Widget buildContent() => Text(users.name);

  Widget buildFollowButton() =>
      ElevatedButton(onPressed: () {}, child: const Text('Follow'));

/*Widget buildButtomAppBar() => BottomAppBar(
        color: Colors.blue,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: <Widget>[
              IconButton(
                tooltip: 'Home Page',
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),
              if (centerLocations.contains(_fabLocation)) const Spacer(),
              IconButton(
                tooltip: 'Most Answered Surveys',
                icon: const Icon(Icons.trending_up),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );*/
}
