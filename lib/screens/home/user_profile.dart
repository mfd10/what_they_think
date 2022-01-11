import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_they_think/models/custom_user.dart';
import 'package:what_they_think/screens/home/home_page.dart';
import 'package:what_they_think/services/database.dart';
import 'package:what_they_think/shared/background_color.dart';
import 'package:what_they_think/screens/home/posting_page.dart';
import 'package:what_they_think/screens/home/setting_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    final user = Provider.of<CustomUser>(context);
    final DatabaseService _db = DatabaseService(uid: user.uid);
    print(_db.getUser());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade800,
        title: Text(user.eMail ?? " "),
        centerTitle: true,
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
            buildContent(user.uid),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        Text('0'),
                        Text('Post'),
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
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return const Center(child:  Text("No posts inserted yet"));
                })
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>const HomePage()));
              },
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

  Widget buildContent(String text) => Text(text);



  Widget buildButtomAppBar() => BottomAppBar(
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
      );
}
