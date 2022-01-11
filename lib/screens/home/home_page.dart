import 'package:flutter/material.dart';
import 'package:what_they_think/shared/background_color.dart';
import 'package:what_they_think/screens/home/user_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan.shade800,
          title: const Center(child: Text('WHAT THEY THINK')),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle_sharp),
              tooltip: 'Profile Page',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Profile()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: backGroundGradient()),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  tileColor: Colors.cyan.shade800,
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: const NetworkImage('https://i.pinimg.com/564x/c1/cc/6c/c1cc6c4894e48c71e74d32e70d252625.jpg'),
                  ),
                  title: const Text('Title from the firebase'),
                  subtitle: const Text('Description '),
                  isThreeLine: true,
                  onTap: () => print('on tap'),
                ),
              );
            }),
      ),
    );
  }
}