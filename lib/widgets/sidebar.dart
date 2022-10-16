import 'package:flutter/material.dart';
import 'package:flutter_p/screens/login.dart';
import 'package:flutter_p/screens/profile.dart';
import 'package:flutter_p/standerds/standerds.dart';
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
              decoration: BoxDecoration(color: Standerds.color1),
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
            setData("Profile", Icons.account_circle, context, const Profile()),
            setData("Settings", Icons.settings, context, const Login()),
            setData("Login", Icons.login, context, const Login()),
            setData("Help", Icons.help_rounded, context, const Login()),
          ],
        ),
      ),
    );
  }
}

setData(String title, IconData icon, BuildContext context, page) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Standerds.color1,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          title: Text(title),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          },
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    ],
  );
}
