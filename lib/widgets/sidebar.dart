import 'package:flutter/material.dart';
import 'package:flutter_p/screens/login.dart';
import 'package:getwidget/getwidget.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GFDrawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GFDrawerHeader(
              decoration: const BoxDecoration(color: Colors.grey),
              centerAlign: true,
              currentAccountPicture: GFAvatar(
                radius: 80.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: const Icon(Icons.account_circle_outlined),
                ),
              ),
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text('user@userid.com'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: const ListTile(
                title: Text('Profile'),
                onTap: null,
                leading: Icon(Icons.account_circle_rounded),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const ListTile(
                title: Text('Settings'),
                onTap: null,
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25),
              ),
              child: ListTile(
                title: const Text('Logout'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                leading: const Icon(Icons.logout),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const ListTile(
                title: Text('Help'),
                onTap: null,
                leading: Icon(Icons.help_rounded),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
