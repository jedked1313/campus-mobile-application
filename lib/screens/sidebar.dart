import 'package:flutter/material.dart';
import 'package:campus_mobile_application/main.dart';
import 'package:campus_mobile_application/screens/login.dart';
import 'package:campus_mobile_application/screens/profile.dart';
import 'package:campus_mobile_application/screens/student_screens/setting.dart';
import 'package:campus_mobile_application/standerds/standerds.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
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
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    sharedPref.getString("username").toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            setData("Profile", Icons.account_circle, context, const Profile()),
            setData("Help and Support", Icons.headphones_rounded, context,
                const Profile()),
            setData(
                "Setting",
                Icons.settings_rounded,
                context,
                Scaffold(
                  appBar: AppBar(title: const Text("Setting")),
                  body: const Setting(),
                )),
            setData("About", Icons.help_rounded, context, const Profile()),
            const Divider(
              thickness: 2,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListTile(
                    title: const Text(
                      "logout",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    onTap: () {
                      showAlertDialog2(
                          context,
                          sharedPref.getString('username').toString(),
                          "Are you sure ou want to log out ?", () {
                        sharedPref.clear();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                            (Route<dynamic> route) => false);
                      });
                    },
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
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
