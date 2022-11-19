import 'package:flutter/material.dart';
import 'package:flutter_p/screens/login.dart';
import 'package:flutter_p/screens/profile.dart';
import 'package:flutter_p/standerds/standerds.dart';
import 'package:flutter_svg/svg.dart';
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
              decoration: BoxDecoration(color: color1),
              centerAlign: true,
              currentAccountPicture: GFAvatar(
                radius: 80.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: SvgPicture.asset(
                    "assets/icon/user1.svg",
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'user@userid.com',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            setData("Profile", Icons.account_circle, context, const Profile()),
            setData("Settings", Icons.settings, context, const Login()),
            setData("Login", Icons.login, context, const Login()),
            setData("Help and Support", Icons.headphones_rounded, context,
                const Login()),
            setData("About", Icons.help_rounded, context, const Login()),
          ],
        ),
      ),
    );
  }
}

setData(String title, IconData icon, BuildContext context, Widget page) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          },
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
